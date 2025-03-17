// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignUpState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignUpState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignUpState()';
  }
}

/// @nodoc
class $SignUpStateCopyWith<$Res> {
  $SignUpStateCopyWith(SignUpState _, $Res Function(SignUpState) __);
}

/// @nodoc

class _Initial implements SignUpState {
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
    return 'SignUpState.initial()';
  }
}

/// @nodoc

class SignUpSaving implements SignUpState {
  const SignUpSaving();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignUpSaving);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignUpState.saving()';
  }
}

/// @nodoc

class SignUpSaved implements SignUpState {
  const SignUpSaved();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignUpSaved);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignUpState.saved()';
  }
}

/// @nodoc

class SignUpLoading implements SignUpState {
  const SignUpLoading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignUpLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignUpState.loading()';
  }
}

/// @nodoc

class SignUpSuccess implements SignUpState {
  const SignUpSuccess(this.user);

  final UserEntity user;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignUpSuccessCopyWith<SignUpSuccess> get copyWith =>
      _$SignUpSuccessCopyWithImpl<SignUpSuccess>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignUpSuccess &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @override
  String toString() {
    return 'SignUpState.success(user: $user)';
  }
}

/// @nodoc
abstract mixin class $SignUpSuccessCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory $SignUpSuccessCopyWith(
          SignUpSuccess value, $Res Function(SignUpSuccess) _then) =
      _$SignUpSuccessCopyWithImpl;
  @useResult
  $Res call({UserEntity user});
}

/// @nodoc
class _$SignUpSuccessCopyWithImpl<$Res>
    implements $SignUpSuccessCopyWith<$Res> {
  _$SignUpSuccessCopyWithImpl(this._self, this._then);

  final SignUpSuccess _self;
  final $Res Function(SignUpSuccess) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
  }) {
    return _then(SignUpSuccess(
      null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
    ));
  }
}

/// @nodoc

class SignUpError implements SignUpState {
  const SignUpError(this.message);

  final String message;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignUpErrorCopyWith<SignUpError> get copyWith =>
      _$SignUpErrorCopyWithImpl<SignUpError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignUpError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'SignUpState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class $SignUpErrorCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory $SignUpErrorCopyWith(
          SignUpError value, $Res Function(SignUpError) _then) =
      _$SignUpErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$SignUpErrorCopyWithImpl<$Res> implements $SignUpErrorCopyWith<$Res> {
  _$SignUpErrorCopyWithImpl(this._self, this._then);

  final SignUpError _self;
  final $Res Function(SignUpError) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(SignUpError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
