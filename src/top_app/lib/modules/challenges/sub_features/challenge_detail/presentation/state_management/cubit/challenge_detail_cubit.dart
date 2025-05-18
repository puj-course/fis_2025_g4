import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:top_app/modules/challenges/sub_features/challenge_detail/domain/entities/competitor_info.dart';
import 'package:top_app/modules/challenges/sub_features/challenge_detail/domain/repository/challenge_detail_repository.dart';
import 'package:top_app/shared/global_state/user/domain/state_management/cubit/user_cubit.dart';

part 'challenge_detail_state.dart';
part 'challenge_detail_cubit.freezed.dart';

@injectable
class ChallengeDetailCubit extends Cubit<ChallengeDetailState> {
  final ChallengeDetailRepository _repository;
  final UserCubit _userCubit;
  ChallengeDetailCubit({
    required ChallengeDetailRepository repository,
    required UserCubit userCubit,
  })  : _repository = repository,
        _userCubit = userCubit,
        super(const ChallengeDetailState.initial());

  Future<List<CompetitorInfo>?> getChallengeCompetitors(String challengeId) async {
    try {
      emit(const ChallengeDetailState.loadingCompetitors());

      final List<CompetitorInfo> competitors = await _repository.getCompetitorsInfo(challengeId);

      emit(ChallengeDetailState.loadedCompetitors(competitors: competitors));
      return competitors;
    } catch (e) {
      final String errorMessage = e.toString().replaceAll('Exception: ', '');
      emit(ChallengeDetailState.errorLoadingCompetitors(errorMessage: errorMessage));
      return null;
    }
  }

  Future<void> joinChallenge(String challengeId) async {
    try {
      emit(const ChallengeDetailState.joiningChallenge());
      await _repository.joinChallenge(challengeId);
      _userCubit.getUser();
      emit(const ChallengeDetailState.joinedChallenge());
    } catch (e) {
      emit(ChallengeDetailState.errorJoiningChallenge(errorMessage: e.toString()));
    }
  }
}
