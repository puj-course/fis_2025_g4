import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/modules/show_sign_up_freature/domain/cubit/sign_up_cubit_mixin.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

@LazySingleton()
class SignUpCubit extends Cubit<SignUpState> with SignUpCubitMixin {
  SignUpCubit() : super(SignUpState.initial());

  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

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
}
