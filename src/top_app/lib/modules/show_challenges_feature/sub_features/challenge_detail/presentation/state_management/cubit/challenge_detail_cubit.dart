import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/challenge_detail/domain/entities/competitor_info.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/challenge_detail/domain/repository/challenge_detail_repository.dart';

part 'challenge_detail_state.dart';
part 'challenge_detail_cubit.freezed.dart';

@injectable
class ChallengeDetailCubit extends Cubit<ChallengeDetailState> {
  final ChallengeDetailRepository _repository;

  ChallengeDetailCubit({
    required ChallengeDetailRepository repository,
  })  : _repository = repository,
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
      emit(const ChallengeDetailState.joinedChallenge());
    } catch (e) {
      emit(ChallengeDetailState.errorJoiningChallenge(errorMessage: e.toString()));
    }
  }
}
