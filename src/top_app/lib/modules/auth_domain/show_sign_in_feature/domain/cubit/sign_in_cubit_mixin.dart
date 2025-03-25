import 'package:bloc/bloc.dart';
import 'package:top_app/modules/auth_domain/show_sign_in_feature/domain/cubit/sign_in_cubit.dart';

mixin SignInCubitMixin on Cubit<SignInState> {
  void savingOperation(void Function() operation) {
    emit(const SignInState.saving());
    operation();
    emit(const SignInState.saved());
  }
}
