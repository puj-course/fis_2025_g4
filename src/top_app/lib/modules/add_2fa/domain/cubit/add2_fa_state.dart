part of 'add2_fa_cubit.dart';

@freezed
class Add2FaState with _$Add2FaState {
  const factory Add2FaState.initial() = _Initial;

  const factory Add2FaState.sendingVerificationCode() = SendingVerificationCode;

  const factory Add2FaState.verificationCodeSent() = VerificationCodeSent;

  const factory Add2FaState.verifyingPhoneNumber() = VerifyingPhoneNumber;

  const factory Add2FaState.phoneNumberVerified() = PhoneNumberVerified;

  const factory Add2FaState.unlinkingPhoneNumber() = UnlinkingPhoneNumber;

  const factory Add2FaState.phoneNumberUnlinked() = PhoneNumberUnlinked;

  const factory Add2FaState.error(String message) = Error;
}
