part of 'sign_in_cubit.dart';

@freezed
class SignInState with _$SignInState {
  const factory SignInState.initial() = _Initial;

  const factory SignInState.saving() = SignInSaving;

  const factory SignInState.saved() = SignInSaved;

  const factory SignInState.loading() = SignInLoading;

  const factory SignInState.success() = SignInSuccess;

  const factory SignInState.error(String message) = SignInError;
}
