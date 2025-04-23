part of 'goals_cubit.dart';

@freezed
class GoalsState with _$GoalsState {
  const factory GoalsState.initial() = _Initial;

  const factory GoalsState.loadingGoals() = LoadingGoals;

  const factory GoalsState.loadedGoals({required List<Goal> goals}) = LoadedGoals;

  const factory GoalsState.goalsError({required String message}) = GoalsError;
}
