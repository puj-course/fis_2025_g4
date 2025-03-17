import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/modules/auth_domain/show_sign_in_feature/domain/cubit/sign_in_cubit_mixin.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

@LazySingleton()
class SignInCubit extends Cubit<SignInState> with SignInCubitMixin {
  SignInCubit() : super(const SignInState.initial());

  String _email = '';
  String _password = '';

  void setEmail(String value) {
    savingOperation(() {
      _email = value.trim();
    });
  }

  void setPassword(String value) {
    savingOperation(() {
      _password = value;
    });
  }

  String get email => _email;
  String get password => _password;

  Future<void> signIn() async {
    try {
      emit(const SignInState.loading());

      // TODO: Implement actual sign-in logic with authentication service

      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      // For now, just emit success if email and password are not empty
      if (_email.isNotEmpty && _password.isNotEmpty) {
        emit(const SignInState.success());
      } else {
        emit(const SignInState.error('Email and password cannot be empty'));
      }
    } catch (e) {
      emit(SignInState.error(e.toString()));
    }
  }
}
