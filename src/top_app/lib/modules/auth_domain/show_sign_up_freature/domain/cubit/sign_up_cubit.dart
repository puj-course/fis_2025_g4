import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/modules/auth_domain/show_sign_up_freature/domain/cubit/sign_up_cubit_mixin.dart';
import 'package:top_app/modules/auth_domain/show_sign_up_freature/domain/repository/sign_up_repository.dart';
import 'package:top_app/shared/global_state/user/api/user_public_api.dart';
import 'package:top_app/shared/global_state/user/domain/entity/user_entity.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

@injectable
class SignUpCubit extends Cubit<SignUpState> with SignUpCubitMixin {
  final SignUpRepository _signUpRepository;
  final UserPublicApi _userPublicApi;

  SignUpCubit(this._signUpRepository, this._userPublicApi) : super(SignUpState.initial());

  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';
  int remainingSeconds = 0;
  int freezedRemainingSeconds = 0;
  int rank = 0;

  void setName(String value) {
    name = value.trim();
  }

  void setEmail(String value) {
    email = value.trim();
  }

  void setPassword(String value) {
    password = value.trim();
  }

  void setConfirmPassword(String value) {
    confirmPassword = value.trim();
  }

  void setRemainingSeconds(int value) {
    remainingSeconds = value;
  }

  Future<void> signUp() async {
    emit(SignUpState.loading());
    try {
      freezedRemainingSeconds = remainingSeconds;

      final User? firebaseUser = await _signUpRepository.signUp(email, password);
      if (firebaseUser != null) {
        // Create a user entity
        final UserEntity user = UserEntity(
          uid: firebaseUser.uid,
          email: email,
          name: name,
          createdAt: DateTime.now(),
          signUpSeconds: freezedRemainingSeconds,
        );

        // Create a user document in the database
        await _userPublicApi.createUser(user);

        // Get the rank of the user
        rank = await _userPublicApi.getUserSignUpRank(60 - freezedRemainingSeconds);

        emit(SignUpState.success(user));
      } else {
        emit(const SignUpState.error('Something went wrong, please try again later'));
      }
    } catch (e) {
      final String errorMessage =
          e.toString().replaceAll(RegExp(r'\[.*?\]'), '').replaceAll('Exception: ', '').trim();
      emit(SignUpState.error(errorMessage));
      print(errorMessage);
    }
  }
}
