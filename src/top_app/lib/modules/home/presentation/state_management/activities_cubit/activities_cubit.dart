import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/modules/home/domain/usecases/activities/get_todays_activities_usecase.dart';
import 'package:top_app/modules/home/domain/usecases/activities/is_activity_completed_usecase.dart';
import 'package:top_app/modules/home/domain/usecases/challenges/get_user_challenges_usecase.dart';
import 'package:top_app/shared/entities/templates/activity.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';
import 'package:top_app/shared/entities/user_specific/user_challenge.dart';
import 'package:top_app/shared/global_state/user/api/user_public_api.dart';
import 'package:top_app/shared/global_state/user/domain/entity/user_entity.dart';
import 'package:top_app/shared/global_state/user/domain/state_management/cubit/user_cubit.dart';

part 'activities_cubit.freezed.dart';
part 'activities_state.dart';

@lazySingleton
class ActivitiesCubit extends Cubit<ActivitiesState> {
  ActivitiesCubit({
    required GetUserChallengesUsecase getUserChallengesUsecase,
    required GetTodaysActivitiesUsecase getTodaysActivitiesUsecase,
    required IsActivityCompletedUsecase isActivityCompletedUsecase,
    required UserPublicApi userPublicApi,
    required UserCubit userCubit,
  })  : _getUserChallengesUsecase = getUserChallengesUsecase,
        _getTodaysActivitiesUsecase = getTodaysActivitiesUsecase,
        _isActivityCompletedUsecase = isActivityCompletedUsecase,
        _userPublicApi = userPublicApi,
        _userCubit = userCubit,
        super(const ActivitiesState.initial()) {
    // Listen to UserCubit state changes
    _userCubit.stream.listen((UserState userState) {
      if (userState is Authenticated) {
        _user = userState.user;
        getUserChallenges();
      }
    });
  }

  StreamSubscription<UserState>? _userSubscription;

  @override
  Future<void> close() {
    _userSubscription?.cancel();
    return super.close();
  }

  // Usecases
  final GetUserChallengesUsecase _getUserChallengesUsecase;
  final GetTodaysActivitiesUsecase _getTodaysActivitiesUsecase;
  final IsActivityCompletedUsecase _isActivityCompletedUsecase;

  // Repositories
  final UserPublicApi _userPublicApi;
  final UserCubit _userCubit;

  // Local State
  UserEntity? _user;
  List<Activity>? todaysActivities;

  Future<UserEntity?> getUser() async {
    try {
      emit(const ActivitiesState.loadingUser());
      final UserEntity? user = await _userPublicApi.getUser();

      if (user == null) {
        emit(const ActivitiesState.error(
          message: 'User not found',
          isUserError: true,
        ));
        return null;
      }

      _user = user;
      emit(ActivitiesState.loaded(user: user));
      return user;
    } catch (e) {
      emit(ActivitiesState.error(
        message: 'Failed to load user: ${e.toString()}',
        isUserError: true,
      ));
      return null;
    }
  }

  Future<void> getUserChallenges() async {
    try {
      if (state is! Loaded) {
        emit(const ActivitiesState.loadingChallenges());
      }

      _user ??= await _userCubit.getUser();

      final List<Challenge> challenges = await _getUserChallengesUsecase.call(
        _user!.challenges.map((UserChallenge e) => e.challengeId).toList(),
      );

      todaysActivities = _getTodaysActivitiesUsecase.call(challenges);

      emit(ActivitiesState.loaded(
        user: _user!,
        challenges: challenges,
        activities: todaysActivities,
      ));
    } catch (e) {
      emit(ActivitiesState.error(
        message: 'Failed to load challenges: ${e.toString()}',
        isUserError: false,
      ));
    }
  }

  bool isActivityCompleted(String activityId) {
    if (_user == null || _user!.challenges.isEmpty) {
      return false;
    }

    return _isActivityCompletedUsecase.call(
      activityId: activityId,
      userChallenges: _user!.challenges,
    );
  }
}
