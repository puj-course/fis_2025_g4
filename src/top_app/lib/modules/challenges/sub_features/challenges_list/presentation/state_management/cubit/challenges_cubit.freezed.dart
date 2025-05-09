// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenges_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChallengesState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChallengesState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChallengesState()';
  }
}

/// @nodoc
class $ChallengesStateCopyWith<$Res> {
  $ChallengesStateCopyWith(
      ChallengesState _, $Res Function(ChallengesState) __);
}

/// @nodoc

class _Initial implements ChallengesState {
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
    return 'ChallengesState.initial()';
  }
}

/// @nodoc

class LoadingChallenges implements ChallengesState {
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
    return 'ChallengesState.loadingChallenges()';
  }
}

/// @nodoc

class LoadedChallenges implements ChallengesState {
  const LoadedChallenges(final List<Challenge> challenges)
      : _challenges = challenges;

  final List<Challenge> _challenges;
  List<Challenge> get challenges {
    if (_challenges is EqualUnmodifiableListView) return _challenges;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_challenges);
  }

  /// Create a copy of ChallengesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadedChallengesCopyWith<LoadedChallenges> get copyWith =>
      _$LoadedChallengesCopyWithImpl<LoadedChallenges>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadedChallenges &&
            const DeepCollectionEquality()
                .equals(other._challenges, _challenges));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_challenges));

  @override
  String toString() {
    return 'ChallengesState.loadedChallenges(challenges: $challenges)';
  }
}

/// @nodoc
abstract mixin class $LoadedChallengesCopyWith<$Res>
    implements $ChallengesStateCopyWith<$Res> {
  factory $LoadedChallengesCopyWith(
          LoadedChallenges value, $Res Function(LoadedChallenges) _then) =
      _$LoadedChallengesCopyWithImpl;
  @useResult
  $Res call({List<Challenge> challenges});
}

/// @nodoc
class _$LoadedChallengesCopyWithImpl<$Res>
    implements $LoadedChallengesCopyWith<$Res> {
  _$LoadedChallengesCopyWithImpl(this._self, this._then);

  final LoadedChallenges _self;
  final $Res Function(LoadedChallenges) _then;

  /// Create a copy of ChallengesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? challenges = null,
  }) {
    return _then(LoadedChallenges(
      null == challenges
          ? _self._challenges
          : challenges // ignore: cast_nullable_to_non_nullable
              as List<Challenge>,
    ));
  }
}

/// @nodoc

class ErrorLoadingChallenges implements ChallengesState {
  const ErrorLoadingChallenges(this.errorMessage);

  final String errorMessage;

  /// Create a copy of ChallengesState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorLoadingChallengesCopyWith<ErrorLoadingChallenges> get copyWith =>
      _$ErrorLoadingChallengesCopyWithImpl<ErrorLoadingChallenges>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorLoadingChallenges &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @override
  String toString() {
    return 'ChallengesState.errorLoadingChallenges(errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $ErrorLoadingChallengesCopyWith<$Res>
    implements $ChallengesStateCopyWith<$Res> {
  factory $ErrorLoadingChallengesCopyWith(ErrorLoadingChallenges value,
          $Res Function(ErrorLoadingChallenges) _then) =
      _$ErrorLoadingChallengesCopyWithImpl;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class _$ErrorLoadingChallengesCopyWithImpl<$Res>
    implements $ErrorLoadingChallengesCopyWith<$Res> {
  _$ErrorLoadingChallengesCopyWithImpl(this._self, this._then);

  final ErrorLoadingChallenges _self;
  final $Res Function(ErrorLoadingChallenges) _then;

  /// Create a copy of ChallengesState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(ErrorLoadingChallenges(
      null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
