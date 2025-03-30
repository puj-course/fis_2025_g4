import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenge_detail/domain/entities/competitor_info.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenge_detail/domain/repository/show_challenge_detail_repository.dart';

part 'show_challenge_detail_state.dart';
part 'show_challenge_detail_cubit.freezed.dart';

@injectable
class ShowChallengeDetailCubit extends Cubit<ShowChallengeDetailState> {
  final ShowChallengeDetailRepository _repository;

  ShowChallengeDetailCubit({
    required ShowChallengeDetailRepository repository,
  })  : _repository = repository,
        super(const ShowChallengeDetailState.initial());

  Future<List<CompetitorInfo>> getChallengeCompetitors(String challengeId) async {
    try {
      emit(const ShowChallengeDetailState.loadingCompetitors());

      final competitors = await _repository.getCompetitorsInfo(challengeId);

      emit(ShowChallengeDetailState.loadedCompetitors(competitors: competitors));
      return competitors;
    } catch (e) {
      final errorMessage = e.toString().replaceAll('Exception: ', '');
      emit(ShowChallengeDetailState.error(message: errorMessage));
      rethrow;
    }
  }
}
