import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/modules/home/domain/usecases/activities/get_todays_activities_usecase.dart';
import 'package:top_app/modules/home/domain/usecases/goals/get_todays_goals_usecase.dart';
import 'package:top_app/modules/home/domain/usecases/challenges/get_user_challenges_usecase.dart';
import 'package:top_app/shared/entities/templates/activity.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';
import 'package:top_app/shared/entities/templates/goal.dart';
import 'package:top_app/shared/entities/user_specific/user_challenge.dart';
import 'package:top_app/shared/global_state/user/api/user_public_api.dart';
import 'package:top_app/shared/global_state/user/domain/entity/user_entity.dart';
import 'package:top_app/shared/global_state/user/domain/state_management/cubit/user_cubit.dart';

part 'home_cubit.freezed.dart';
part 'home_state.dart';

@lazySingleton
class HomeCubit extends Cubit<HomeState> {
  HomeCubit({
    required GetUserChallengesUsecase getUserChallengesUsecase,
    required GetTodaysActivitiesUsecase getTodaysActivitiesUsecase,
    required GetTodaysGoalsUsecase getTodaysGoalsUsecase,
    required UserPublicApi userPublicApi,
    required UserCubit userCubit,
  })  : _getUserChallengesUsecase = getUserChallengesUsecase,
        _getTodaysActivitiesUsecase = getTodaysActivitiesUsecase,
        _getTodaysGoalsUsecase = getTodaysGoalsUsecase,
        _userPublicApi = userPublicApi,
        _userCubit = userCubit,
        super(const HomeState.initial()) {
    // Listen to UserCubit state changes
    _userCubit.stream.listen((UserState userState) {
      if (userState is Authenticated) {
        _user = userState.user;
        getUserChallenges();
      }
    });
  }

  // Usecases
  final GetUserChallengesUsecase _getUserChallengesUsecase;
  final GetTodaysActivitiesUsecase _getTodaysActivitiesUsecase;
  final GetTodaysGoalsUsecase _getTodaysGoalsUsecase;

  // Repositories
  final UserPublicApi _userPublicApi;
  final UserCubit _userCubit;

  // Local State
  UserEntity? _user;
  List<Activity>? _todaysActivities;
  List<Goal>? _todaysGoals;

  Future<UserEntity?> getUser() async {
    try {
      emit(const HomeState.loadingUser());
      final UserEntity? user = await _userPublicApi.getUser();

      if (user == null) {
        emit(const HomeState.error(
          message: 'User not found',
          isUserError: true,
        ));
        return null;
      }

      _user = user;
      emit(HomeState.loaded(user: user));
      return user;
    } catch (e) {
      emit(HomeState.error(
        message: 'Failed to load user: ${e.toString()}',
        isUserError: true,
      ));
      return null;
    }
  }

  Future<void> getUserChallenges() async {
    try {
      emit(const HomeState.loadingChallenges());

      if (_user == null) {
        emit(const HomeState.error(
          message: 'User not found',
          isUserError: true,
        ));
        return;
      }

      final List<Challenge> challenges = await _getUserChallengesUsecase.call(
        _user!.challenges.map((UserChallenge e) => e.challengeId).toList(),
      );

      _todaysActivities = _getTodaysActivitiesUsecase.call(challenges);
      _todaysGoals = _getTodaysGoalsUsecase.call(_user!.goals);

      emit(HomeState.loaded(
        user: _user!,
        challenges: challenges,
        activities: _todaysActivities,
        goals: _todaysGoals,
      ));
    } catch (e) {
      emit(HomeState.error(
        message: 'Failed to load challenges: ${e.toString()}',
        isUserError: false,
      ));
    }
  }
}
