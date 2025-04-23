part of 'home_cubit.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;
  const factory HomeState.loadingUser() = LoadingUser;
  const factory HomeState.loadingChallenges() = LoadingChallenges;
  const factory HomeState.loaded({
    required UserEntity user,
    List<Challenge>? challenges,
    List<Activity>? activities,
    List<Goal>? goals,
  }) = Loaded;
  const factory HomeState.error({
    required String message,
    @Default(false) bool isUserError,
  }) = Error;
}
