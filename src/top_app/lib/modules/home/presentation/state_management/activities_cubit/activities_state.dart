part of 'activities_cubit.dart';

@freezed
class ActivitiesState with _$ActivitiesState {
  const factory ActivitiesState.initial() = _Initial;
  const factory ActivitiesState.loadingUser() = LoadingUser;
  const factory ActivitiesState.loadingChallenges() = LoadingChallenges;
  const factory ActivitiesState.loaded({
    required UserEntity user,
    List<Challenge>? challenges,
    List<Activity>? activities,
  }) = Loaded;
  const factory ActivitiesState.error({
    required String message,
    @Default(false) bool isUserError,
  }) = Error;
}
