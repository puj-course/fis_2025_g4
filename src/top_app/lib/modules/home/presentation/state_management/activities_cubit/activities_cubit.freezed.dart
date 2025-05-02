// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'activities_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ActivitiesState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ActivitiesState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ActivitiesState()';
  }
}

/// @nodoc
class $ActivitiesStateCopyWith<$Res> {
  $ActivitiesStateCopyWith(
      ActivitiesState _, $Res Function(ActivitiesState) __);
}

/// @nodoc

class _Initial implements ActivitiesState {
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
    return 'ActivitiesState.initial()';
  }
}

/// @nodoc

class LoadingUser implements ActivitiesState {
  const LoadingUser();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingUser);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ActivitiesState.loadingUser()';
  }
}

/// @nodoc

class LoadingChallenges implements ActivitiesState {
  const LoadingChallenges();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingChallenges);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ActivitiesState.loadingChallenges()';
  }
}

/// @nodoc

class Loaded implements ActivitiesState {
  const Loaded(
      {required this.user,
      final List<Challenge>? challenges,
      final List<Activity>? activities})
      : _challenges = challenges,
        _activities = activities;

  final UserEntity user;
  final List<Challenge>? _challenges;
  List<Challenge>? get challenges {
    final value = _challenges;
    if (value == null) return null;
    if (_challenges is EqualUnmodifiableListView) return _challenges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Activity>? _activities;
  List<Activity>? get activities {
    final value = _activities;
    if (value == null) return null;
    if (_activities is EqualUnmodifiableListView) return _activities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of ActivitiesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadedCopyWith<Loaded> get copyWith =>
      _$LoadedCopyWithImpl<Loaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Loaded &&
            (identical(other.user, user) || other.user == user) &&
            const DeepCollectionEquality()
                .equals(other._challenges, _challenges) &&
            const DeepCollectionEquality()
                .equals(other._activities, _activities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      const DeepCollectionEquality().hash(_challenges),
      const DeepCollectionEquality().hash(_activities));

  @override
  String toString() {
    return 'ActivitiesState.loaded(user: $user, challenges: $challenges, activities: $activities)';
  }
}

/// @nodoc
abstract mixin class $LoadedCopyWith<$Res>
    implements $ActivitiesStateCopyWith<$Res> {
  factory $LoadedCopyWith(Loaded value, $Res Function(Loaded) _then) =
      _$LoadedCopyWithImpl;
  @useResult
  $Res call(
      {UserEntity user,
      List<Challenge>? challenges,
      List<Activity>? activities});
}

/// @nodoc
class _$LoadedCopyWithImpl<$Res> implements $LoadedCopyWith<$Res> {
  _$LoadedCopyWithImpl(this._self, this._then);

  final Loaded _self;
  final $Res Function(Loaded) _then;

  /// Create a copy of ActivitiesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = null,
    Object? challenges = freezed,
    Object? activities = freezed,
  }) {
    return _then(Loaded(
      user: null == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserEntity,
      challenges: freezed == challenges
          ? _self._challenges
          : challenges // ignore: cast_nullable_to_non_nullable
              as List<Challenge>?,
      activities: freezed == activities
          ? _self._activities
          : activities // ignore: cast_nullable_to_non_nullable
              as List<Activity>?,
    ));
  }
}

/// @nodoc

class Error implements ActivitiesState {
  const Error({required this.message, this.isUserError = false});

  final String message;
  @JsonKey()
  final bool isUserError;

  /// Create a copy of ActivitiesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorCopyWith<Error> get copyWith =>
      _$ErrorCopyWithImpl<Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Error &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isUserError, isUserError) ||
                other.isUserError == isUserError));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, isUserError);

  @override
  String toString() {
    return 'ActivitiesState.error(message: $message, isUserError: $isUserError)';
  }
}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res>
    implements $ActivitiesStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) =
      _$ErrorCopyWithImpl;
  @useResult
  $Res call({String message, bool isUserError});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

  /// Create a copy of ActivitiesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? isUserError = null,
  }) {
    return _then(Error(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isUserError: null == isUserError
          ? _self.isUserError
          : isUserError // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
