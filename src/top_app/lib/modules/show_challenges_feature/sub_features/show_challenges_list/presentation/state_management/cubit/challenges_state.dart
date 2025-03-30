part of 'challenges_cubit.dart';

@freezed
class ChallengesState with _$ChallengesState {
  const factory ChallengesState.initial() = _Initial;
  const factory ChallengesState.loadingChallenges() = LoadingChallenges;
  const factory ChallengesState.loadedChallenges(List<Challenge> challenges) = LoadedChallenges;
  const factory ChallengesState.errorLoadingChallenges(String errorMessage) =
      ErrorLoadingChallenges;
}
