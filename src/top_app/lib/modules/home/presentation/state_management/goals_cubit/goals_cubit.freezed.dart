// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'goals_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GoalsState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GoalsState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GoalsState()';
  }
}

/// @nodoc
class $GoalsStateCopyWith<$Res> {
  $GoalsStateCopyWith(GoalsState _, $Res Function(GoalsState) __);
}

/// @nodoc

class _Initial implements GoalsState {
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
    return 'GoalsState.initial()';
  }
}

/// @nodoc

class LoadingGoals implements GoalsState {
  const LoadingGoals();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingGoals);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'GoalsState.loadingGoals()';
  }
}

/// @nodoc

class LoadedGoals implements GoalsState {
  const LoadedGoals({required final List<Goal> goals}) : _goals = goals;

  final List<Goal> _goals;
  List<Goal> get goals {
    if (_goals is EqualUnmodifiableListView) return _goals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_goals);
  }

  /// Create a copy of GoalsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadedGoalsCopyWith<LoadedGoals> get copyWith =>
      _$LoadedGoalsCopyWithImpl<LoadedGoals>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadedGoals &&
            const DeepCollectionEquality().equals(other._goals, _goals));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_goals));

  @override
  String toString() {
    return 'GoalsState.loadedGoals(goals: $goals)';
  }
}

/// @nodoc
abstract mixin class $LoadedGoalsCopyWith<$Res>
    implements $GoalsStateCopyWith<$Res> {
  factory $LoadedGoalsCopyWith(
          LoadedGoals value, $Res Function(LoadedGoals) _then) =
      _$LoadedGoalsCopyWithImpl;
  @useResult
  $Res call({List<Goal> goals});
}

/// @nodoc
class _$LoadedGoalsCopyWithImpl<$Res> implements $LoadedGoalsCopyWith<$Res> {
  _$LoadedGoalsCopyWithImpl(this._self, this._then);

  final LoadedGoals _self;
  final $Res Function(LoadedGoals) _then;

  /// Create a copy of GoalsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? goals = null,
  }) {
    return _then(LoadedGoals(
      goals: null == goals
          ? _self._goals
          : goals // ignore: cast_nullable_to_non_nullable
              as List<Goal>,
    ));
  }
}

/// @nodoc

class GoalsError implements GoalsState {
  const GoalsError({required this.message});

  final String message;

  /// Create a copy of GoalsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GoalsErrorCopyWith<GoalsError> get copyWith =>
      _$GoalsErrorCopyWithImpl<GoalsError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GoalsError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'GoalsState.goalsError(message: $message)';
  }
}

/// @nodoc
abstract mixin class $GoalsErrorCopyWith<$Res>
    implements $GoalsStateCopyWith<$Res> {
  factory $GoalsErrorCopyWith(
          GoalsError value, $Res Function(GoalsError) _then) =
      _$GoalsErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$GoalsErrorCopyWithImpl<$Res> implements $GoalsErrorCopyWith<$Res> {
  _$GoalsErrorCopyWithImpl(this._self, this._then);

  final GoalsError _self;
  final $Res Function(GoalsError) _then;

  /// Create a copy of GoalsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(GoalsError(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
