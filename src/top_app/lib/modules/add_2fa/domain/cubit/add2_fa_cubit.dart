import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/core/providers/firebase_provider.dart';

part 'add2_fa_state.dart';
part 'add2_fa_cubit.freezed.dart';

@injectable
class Add2FaCubit extends Cubit<Add2FaState> {
  final FirebaseProvider _firebaseProvider;

  Add2FaCubit({required FirebaseProvider firebaseProvider})
      : _firebaseProvider = firebaseProvider,
        super(Add2FaState.initial());

  String? _verificationId;

  Future<void> sendVerificationCode(String phoneNumber) async {
    try {
      emit(Add2FaState.sendingVerificationCode());

      if (phoneNumber.isEmpty) {
        emit(Add2FaState.error('Phone number is empty'));
        return;
      }

      await _firebaseProvider.firebaseAuth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          emit(Add2FaState.error(e.message!));
        },
        codeSent: (String verificationId, int? forceResendingToken) {
          _verificationId = verificationId;
          emit(Add2FaState.verificationCodeSent());
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (_) {}
  }

  Future<void> verifyPhoneNumber(String code) async {
    try {
      emit(Add2FaState.verifyingPhoneNumber());

      if (_verificationId == null) {
        emit(Add2FaState.error('Verification ID is null'));
        return;
      }

      if (code.isEmpty) {
        emit(Add2FaState.error('Code is empty'));
        return;
      }

      final PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: _verificationId!,
        smsCode: code,
      );

      await _firebaseProvider.firebaseAuth.currentUser!.linkWithCredential(credential);
      emit(Add2FaState.phoneNumberVerified());
    } catch (e) {
      emit(Add2FaState.error(e.toString()));
    }
  }

  Future<void> unlinkPhoneNumber() async {
    try {
      emit(Add2FaState.unlinkingPhoneNumber());
      await _firebaseProvider.firebaseAuth.currentUser!.unlink('phone');
      emit(Add2FaState.phoneNumberUnlinked());
    } catch (e) {
      emit(Add2FaState.error(e.toString()));
    }
  }
}
