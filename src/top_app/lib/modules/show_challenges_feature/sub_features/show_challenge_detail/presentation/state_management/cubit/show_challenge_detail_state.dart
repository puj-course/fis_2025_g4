part of 'show_challenge_detail_cubit.dart';

@freezed
class ShowChallengeDetailState with _$ShowChallengeDetailState {
  const factory ShowChallengeDetailState.initial() = Initial;
  const factory ShowChallengeDetailState.loadingCompetitors() = LoadingCompetitors;
  const factory ShowChallengeDetailState.loadedCompetitors({
    required List<CompetitorInfo> competitors,
  }) = LoadedCompetitors;

  const factory ShowChallengeDetailState.errorLoadingCompetitors({
    required String errorMessage,
  }) = ErrorLoadingCompetitors;
}
