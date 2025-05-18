import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/modules/auth_domain/show_sign_in_feature/domain/cubit/sign_in_cubit_mixin.dart';
import 'package:top_app/modules/auth_domain/show_sign_in_feature/domain/repository/sign_in_repository.dart';

part 'sign_in_state.dart';
part 'sign_in_cubit.freezed.dart';

@LazySingleton()
class SignInCubit extends Cubit<SignInState> with SignInCubitMixin {
  final SignInRepository _signInRepository;

  SignInCubit({required SignInRepository signInRepository})
      : _signInRepository = signInRepository,
        super(const SignInState.initial());

  String _email = '';
  String _password = '';

  void setEmail(String value) {
    _email = value.trim();
  }

  void setPassword(String value) {
    _password = value;
  }

  String get email => _email;
  String get password => _password;

  Future<void> signIn() async {
    try {
      emit(const SignInState.loading());
      await _signInRepository.signIn(_email, _password);
      emit(const SignInState.success());
    } catch (e) {
      final String errorMessage = e.toString().contains('[firebase_auth/invalid-credential]')
          ? 'Wrong email or password'
          : e.toString();
      emit(SignInState.error(errorMessage));
    }
  }
}
