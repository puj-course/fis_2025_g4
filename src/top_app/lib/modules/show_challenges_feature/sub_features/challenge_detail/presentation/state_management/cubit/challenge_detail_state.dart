part of 'challenge_detail_cubit.dart';

@freezed
class ChallengeDetailState with _$ChallengeDetailState {
  const factory ChallengeDetailState.initial() = Initial;
  const factory ChallengeDetailState.loadingCompetitors() = LoadingCompetitors;
  const factory ChallengeDetailState.loadedCompetitors({
    required List<CompetitorInfo> competitors,
  }) = LoadedCompetitors;

  const factory ChallengeDetailState.errorLoadingCompetitors({
    required String errorMessage,
  }) = ErrorLoadingCompetitors;

  const factory ChallengeDetailState.joiningChallenge() = JoiningChallenge;

  const factory ChallengeDetailState.joinedChallenge() = JoinedChallenge;

  const factory ChallengeDetailState.errorJoiningChallenge({
    required String errorMessage,
  }) = ErrorJoiningChallenge;
}
