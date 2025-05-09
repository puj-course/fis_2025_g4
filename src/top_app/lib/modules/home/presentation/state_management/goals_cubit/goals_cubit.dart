import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/modules/home/domain/usecases/goals/create_goal_usecase.dart';
import 'package:top_app/modules/home/domain/usecases/goals/delete_goal_usecase.dart';
import 'package:top_app/modules/home/domain/usecases/goals/edit_goal_name_usecase.dart';
import 'package:top_app/modules/home/domain/usecases/goals/get_todays_goals_usecase.dart';
import 'package:top_app/modules/home/domain/usecases/goals/toggle_goal_completion_usecase.dart';
import 'package:top_app/shared/entities/templates/goal.dart';
import 'package:top_app/shared/global_state/user/api/user_public_api.dart';
import 'package:top_app/shared/global_state/user/domain/entity/user_entity.dart';
import 'package:top_app/shared/global_state/user/domain/state_management/cubit/user_cubit.dart';

part 'goals_state.dart';
part 'goals_cubit.freezed.dart';

@lazySingleton
class GoalsCubit extends Cubit<GoalsState> {
  final CreateGoalUsecase createGoalUsecase;
  final DeleteGoalUsecase deleteGoalUsecase;
  final EditGoalNameUsecase editGoalNameUsecase;
  final ToggleGoalCompletionUsecase toggleGoalCompletionUsecase;
  final UserPublicApi userPublicApi;
  final UserCubit userCubit;
  final GetTodaysGoalsUsecase getTodaysGoalsUsecase;

  StreamSubscription<UserState>? userSubscription;

  GoalsCubit(
    this.createGoalUsecase,
    this.deleteGoalUsecase,
    this.editGoalNameUsecase,
    this.userPublicApi,
    this.toggleGoalCompletionUsecase,
    this.userCubit,
    this.getTodaysGoalsUsecase,
  ) : super(GoalsState.initial()) {
    userSubscription = userCubit.stream.listen((UserState state) {
      if (state is Authenticated && goals.isEmpty) {
        loadGoals();
      }
    });
  }

  @override
  Future<void> close() {
    userSubscription?.cancel();
    return super.close();
  }

  List<Goal> goals = <Goal>[];

  void loadGoals() {
    emit(GoalsState.loadingGoals());
    final List<Goal> userGoals = userCubit.getUserGoals();
    goals = getTodaysGoalsUsecase.call(userGoals);
    emit(GoalsState.loadedGoals(goals: goals));
  }

  void addGoal(String goalName) async {
    emit(GoalsState.loadingGoals());
    try {
      // Update local state immediately
      goals = createGoalUsecase.call(goalName, goals);
      emit(GoalsState.loadedGoals(goals: goals));

      // Update backend asynchronously
      final UserEntity? user = await userPublicApi.getUser();
      if (user != null) {
        final UserEntity updatedUser = user.copyWith(goals: goals);
        userPublicApi.updateUser(updatedUser);
      }
    } catch (e) {
      emit(GoalsState.goalsError(message: e.toString()));
    }
  }

  void deleteGoal(String goalId) async {
    emit(GoalsState.loadingGoals());
    try {
      // Update local state immediately
      goals = deleteGoalUsecase.call(goalId, goals);
      emit(GoalsState.loadedGoals(goals: goals));

      // Update backend asynchronously
      final UserEntity? user = await userPublicApi.getUser();
      if (user != null) {
        final UserEntity updatedUser = user.copyWith(goals: goals);
        await userPublicApi.updateUser(updatedUser);
      }
    } catch (e) {
      emit(GoalsState.goalsError(message: e.toString()));
    }
  }

  void editGoalName(String goalId, String newName) async {
    emit(GoalsState.loadingGoals());
    try {
      // Update local state immediately
      goals = editGoalNameUsecase.call(goalId, newName, goals);
      emit(GoalsState.loadedGoals(goals: goals));

      // Update backend asynchronously
      final UserEntity? user = await userPublicApi.getUser();
      if (user != null) {
        final UserEntity updatedUser = user.copyWith(goals: goals);
        userPublicApi.updateUser(updatedUser);
      }
    } catch (e) {
      emit(GoalsState.goalsError(message: e.toString()));
    }
  }

  Future<void> toggleGoal(String goalId) async {
    emit(GoalsState.loadingGoals());
    try {
      // Update local state immediately
      goals = toggleGoalCompletionUsecase.call(goalId: goalId, currentGoals: goals);
      emit(GoalsState.loadedGoals(goals: goals));

      // Update backend asynchronously
      final UserEntity? user = await userPublicApi.getUser();
      if (user != null) {
        final UserEntity updatedUser = user.copyWith(goals: goals);
        userPublicApi.updateUser(updatedUser);
      }
    } catch (e) {
      emit(GoalsState.goalsError(message: e.toString()));
    }
  }
}
