import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/modules/home/domain/usecases/goals/create_goal_usecase.dart';
import 'package:top_app/modules/home/domain/usecases/goals/delete_goal_usecase.dart';
import 'package:top_app/modules/home/domain/usecases/goals/edit_goal_name_usecase.dart';
import 'package:top_app/modules/home/domain/usecases/goals/toggle_goal_completion_usecase.dart';
import 'package:top_app/shared/entities/templates/goal.dart';
import 'package:top_app/shared/global_state/user/api/user_public_api.dart';

part 'goals_state.dart';
part 'goals_cubit.freezed.dart';

@lazySingleton
class GoalsCubit extends Cubit<GoalsState> {
  final CreateGoalUsecase createGoalUsecase;
  final DeleteGoalUsecase deleteGoalUsecase;
  final EditGoalNameUsecase editGoalNameUsecase;
  final ToggleGoalCompletionUsecase toggleGoalCompletionUsecase;
  final UserPublicApi userPublicApi;

  GoalsCubit(this.createGoalUsecase, this.deleteGoalUsecase, this.editGoalNameUsecase,
      this.userPublicApi, this.toggleGoalCompletionUsecase)
      : super(GoalsState.initial());

  List<Goal> goals = <Goal>[];

  void loadGoals(List<Goal> goals) {
    emit(GoalsState.loadingGoals());
    this.goals = goals;
    emit(GoalsState.loadedGoals(goals: goals));
  }

  void addGoal(String goalName) async {
    emit(GoalsState.loadingGoals());
    try {
      goals = await createGoalUsecase.call(goalName);
      emit(GoalsState.loadedGoals(goals: goals));
    } catch (e) {
      emit(GoalsState.goalsError(message: e.toString()));
    }
  }

  void deleteGoal(String goalId) async {
    emit(GoalsState.loadingGoals());
    try {
      goals = await deleteGoalUsecase.call(goalId);
      emit(GoalsState.loadedGoals(goals: goals));
    } catch (e) {
      emit(GoalsState.goalsError(message: e.toString()));
    }
  }

  void editGoalName(String goalId, String newName) async {
    emit(GoalsState.loadingGoals());
    try {
      goals = await editGoalNameUsecase.call(goalId, newName);
      emit(GoalsState.loadedGoals(goals: goals));
    } catch (e) {
      emit(GoalsState.goalsError(message: e.toString()));
    }
  }

  Future<void> toggleGoal(String goalId) async {
    emit(GoalsState.loadingGoals());
    try {
      goals = await toggleGoalCompletionUsecase.call(goalId: goalId);
      emit(GoalsState.loadedGoals(goals: goals));
    } catch (e) {
      emit(GoalsState.goalsError(message: e.toString()));
    }
  }
}
