import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/modules/auth_domain/show_sign_up_freature/domain/cubit/sign_up_cubit.dart';

/// A mixin for SignUpCubit that provides utility methods for handling operations
/// with appropriate state management.
mixin SignUpCubitMixin on Cubit<SignUpState> {
  /// Wraps a synchronous operation with saving and saved states.
  ///
  /// Example usage:
  /// ```dart
  /// savingOperation(() {
  ///   userData.name = newName;
  ///   userData.validate();
  /// });
  /// ```
  void savingOperation(void Function() operation) {
    try {
      // Emit saving state before the operation
      emit(const SignUpState.saving());

      // Execute the operation
      operation();

      // Emit saved state after successful completion
      emit(const SignUpState.saved());
    } catch (e) {
      // Emit error state if the operation fails
      emit(SignUpState.error(e.toString()));
    }
  }
}
