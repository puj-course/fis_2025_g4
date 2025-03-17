part of 'sign_up_cubit.dart';

@freezed
class SignUpState with _$SignUpState {
  const factory SignUpState.initial() = _Initial;

  const factory SignUpState.saving() = SignUpSaving;

  const factory SignUpState.saved() = SignUpSaved;

  const factory SignUpState.loading() = SignUpLoading;

  const factory SignUpState.success(UserEntity user) = SignUpSuccess;

  const factory SignUpState.error(String message) = SignUpError;
}
