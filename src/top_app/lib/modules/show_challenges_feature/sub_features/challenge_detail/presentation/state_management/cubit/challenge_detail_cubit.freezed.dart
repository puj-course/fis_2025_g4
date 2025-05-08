// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'challenge_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChallengeDetailState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ChallengeDetailState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChallengeDetailState()';
  }
}

/// @nodoc
class $ChallengeDetailStateCopyWith<$Res> {
  $ChallengeDetailStateCopyWith(
      ChallengeDetailState _, $Res Function(ChallengeDetailState) __);
}

/// @nodoc

class Initial implements ChallengeDetailState {
  const Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChallengeDetailState.initial()';
  }
}

/// @nodoc

class LoadingCompetitors implements ChallengeDetailState {
  const LoadingCompetitors();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingCompetitors);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChallengeDetailState.loadingCompetitors()';
  }
}

/// @nodoc

class LoadedCompetitors implements ChallengeDetailState {
  const LoadedCompetitors({required final List<CompetitorInfo> competitors})
      : _competitors = competitors;

  final List<CompetitorInfo> _competitors;
  List<CompetitorInfo> get competitors {
    if (_competitors is EqualUnmodifiableListView) return _competitors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_competitors);
  }

  /// Create a copy of ChallengeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadedCompetitorsCopyWith<LoadedCompetitors> get copyWith =>
      _$LoadedCompetitorsCopyWithImpl<LoadedCompetitors>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoadedCompetitors &&
            const DeepCollectionEquality()
                .equals(other._competitors, _competitors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_competitors));

  @override
  String toString() {
    return 'ChallengeDetailState.loadedCompetitors(competitors: $competitors)';
  }
}

/// @nodoc
abstract mixin class $LoadedCompetitorsCopyWith<$Res>
    implements $ChallengeDetailStateCopyWith<$Res> {
  factory $LoadedCompetitorsCopyWith(
          LoadedCompetitors value, $Res Function(LoadedCompetitors) _then) =
      _$LoadedCompetitorsCopyWithImpl;
  @useResult
  $Res call({List<CompetitorInfo> competitors});
}

/// @nodoc
class _$LoadedCompetitorsCopyWithImpl<$Res>
    implements $LoadedCompetitorsCopyWith<$Res> {
  _$LoadedCompetitorsCopyWithImpl(this._self, this._then);

  final LoadedCompetitors _self;
  final $Res Function(LoadedCompetitors) _then;

  /// Create a copy of ChallengeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? competitors = null,
  }) {
    return _then(LoadedCompetitors(
      competitors: null == competitors
          ? _self._competitors
          : competitors // ignore: cast_nullable_to_non_nullable
              as List<CompetitorInfo>,
    ));
  }
}

/// @nodoc

class ErrorLoadingCompetitors implements ChallengeDetailState {
  const ErrorLoadingCompetitors({required this.errorMessage});

  final String errorMessage;

  /// Create a copy of ChallengeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorLoadingCompetitorsCopyWith<ErrorLoadingCompetitors> get copyWith =>
      _$ErrorLoadingCompetitorsCopyWithImpl<ErrorLoadingCompetitors>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorLoadingCompetitors &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @override
  String toString() {
    return 'ChallengeDetailState.errorLoadingCompetitors(errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $ErrorLoadingCompetitorsCopyWith<$Res>
    implements $ChallengeDetailStateCopyWith<$Res> {
  factory $ErrorLoadingCompetitorsCopyWith(ErrorLoadingCompetitors value,
          $Res Function(ErrorLoadingCompetitors) _then) =
      _$ErrorLoadingCompetitorsCopyWithImpl;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class _$ErrorLoadingCompetitorsCopyWithImpl<$Res>
    implements $ErrorLoadingCompetitorsCopyWith<$Res> {
  _$ErrorLoadingCompetitorsCopyWithImpl(this._self, this._then);

  final ErrorLoadingCompetitors _self;
  final $Res Function(ErrorLoadingCompetitors) _then;

  /// Create a copy of ChallengeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(ErrorLoadingCompetitors(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class JoiningChallenge implements ChallengeDetailState {
  const JoiningChallenge();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is JoiningChallenge);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChallengeDetailState.joiningChallenge()';
  }
}

/// @nodoc

class JoinedChallenge implements ChallengeDetailState {
  const JoinedChallenge();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is JoinedChallenge);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ChallengeDetailState.joinedChallenge()';
  }
}

/// @nodoc

class ErrorJoiningChallenge implements ChallengeDetailState {
  const ErrorJoiningChallenge({required this.errorMessage});

  final String errorMessage;

  /// Create a copy of ChallengeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErrorJoiningChallengeCopyWith<ErrorJoiningChallenge> get copyWith =>
      _$ErrorJoiningChallengeCopyWithImpl<ErrorJoiningChallenge>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ErrorJoiningChallenge &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorMessage);

  @override
  String toString() {
    return 'ChallengeDetailState.errorJoiningChallenge(errorMessage: $errorMessage)';
  }
}

/// @nodoc
abstract mixin class $ErrorJoiningChallengeCopyWith<$Res>
    implements $ChallengeDetailStateCopyWith<$Res> {
  factory $ErrorJoiningChallengeCopyWith(ErrorJoiningChallenge value,
          $Res Function(ErrorJoiningChallenge) _then) =
      _$ErrorJoiningChallengeCopyWithImpl;
  @useResult
  $Res call({String errorMessage});
}

/// @nodoc
class _$ErrorJoiningChallengeCopyWithImpl<$Res>
    implements $ErrorJoiningChallengeCopyWith<$Res> {
  _$ErrorJoiningChallengeCopyWithImpl(this._self, this._then);

  final ErrorJoiningChallenge _self;
  final $Res Function(ErrorJoiningChallenge) _then;

  /// Create a copy of ChallengeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? errorMessage = null,
  }) {
    return _then(ErrorJoiningChallenge(
      errorMessage: null == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
