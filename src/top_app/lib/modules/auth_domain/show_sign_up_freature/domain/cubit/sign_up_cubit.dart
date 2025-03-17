import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/modules/auth_domain/show_sign_up_freature/domain/cubit/sign_up_cubit_mixin.dart';
import 'package:top_app/modules/auth_domain/show_sign_up_freature/domain/repository/sign_up_repository.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

@LazySingleton()
class SignUpCubit extends Cubit<SignUpState> with SignUpCubitMixin {
  final SignUpRepository _signUpRepository;

  SignUpCubit(this._signUpRepository) : super(SignUpState.initial());

  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  int remainingSeconds = 0;
  void setName(String value) {
    savingOperation(() {
      name = value.trim();
    });
  }

  void setEmail(String value) {
    savingOperation(() {
      email = value.trim();
    });
  }

  void setPassword(String value) {
    savingOperation(() {
      password = value.trim();
    });
  }

  void setConfirmPassword(String value) {
    savingOperation(() {
      confirmPassword = value.trim();
    });
  }

  void setRemainingSeconds(int value) {
    savingOperation(() {
      remainingSeconds = value;
    });
  }

  Future<void> signUp() async {
    emit(SignUpState.loading());
    try {
      final User? user = await _signUpRepository.signUp(email, password);
      if (user != null) {
        emit(SignUpState.success(user));
      } else {
        emit(const SignUpState.error('Something went wrong, please try again later'));
      }
    } catch (e) {
      emit(SignUpState.error(e.toString()));
    }
  }
}
