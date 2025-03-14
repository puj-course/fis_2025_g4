// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignInState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignInState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignInState()';
  }
}

/// @nodoc
class $SignInStateCopyWith<$Res> {
  $SignInStateCopyWith(SignInState _, $Res Function(SignInState) __);
}

/// @nodoc

class _Initial implements SignInState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignInState.initial()';
  }
}

/// @nodoc

class SignInSaving implements SignInState {
  const SignInSaving();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignInSaving);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignInState.saving()';
  }
}

/// @nodoc

class SignInSaved implements SignInState {
  const SignInSaved();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignInSaved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignInState.saved()';
  }
}

/// @nodoc

class SignInLoading implements SignInState {
  const SignInLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignInLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignInState.loading()';
  }
}

/// @nodoc

class SignInSuccess implements SignInState {
  const SignInSuccess();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignInSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignInState.success()';
  }
}

/// @nodoc

class SignInError implements SignInState {
  const SignInError(this.message);

  final String message;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignInErrorCopyWith<SignInError> get copyWith =>
      _$SignInErrorCopyWithImpl<SignInError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignInError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'SignInState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $SignInErrorCopyWith<$Res>
    implements $SignInStateCopyWith<$Res> {
  factory $SignInErrorCopyWith(
          SignInError value, $Res Function(SignInError) _then) =
      _$SignInErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$SignInErrorCopyWithImpl<$Res> implements $SignInErrorCopyWith<$Res> {
  _$SignInErrorCopyWithImpl(this._self, this._then);

  final SignInError _self;
  final $Res Function(SignInError) _then;

  /// Create a copy of SignInState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(SignInError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
