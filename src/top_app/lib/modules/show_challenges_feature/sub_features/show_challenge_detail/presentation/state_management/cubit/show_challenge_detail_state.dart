part of 'show_challenge_detail_cubit.dart';

@freezed
class ShowChallengeDetailState with _$ShowChallengeDetailState {
  const factory ShowChallengeDetailState.initial() = _Initial;
  const factory ShowChallengeDetailState.loadingCompetitors() = _LoadingCompetitors;
  const factory ShowChallengeDetailState.loadedCompetitors({
    required List<CompetitorInfo> competitors,
  }) = _LoadedCompetitors;
  const factory ShowChallengeDetailState.error({
    required String message,
  }) = _Error;
}
