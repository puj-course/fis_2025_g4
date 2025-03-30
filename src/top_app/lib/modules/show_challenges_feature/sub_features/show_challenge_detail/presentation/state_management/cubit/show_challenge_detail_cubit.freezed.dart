// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'show_challenge_detail_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ShowChallengeDetailState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ShowChallengeDetailState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ShowChallengeDetailState()';
  }
}

/// @nodoc
class $ShowChallengeDetailStateCopyWith<$Res> {
  $ShowChallengeDetailStateCopyWith(
      ShowChallengeDetailState _, $Res Function(ShowChallengeDetailState) __);
}

/// @nodoc

class _Initial implements ShowChallengeDetailState {
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
    return 'ShowChallengeDetailState.initial()';
  }
}

/// @nodoc

class _LoadingCompetitors implements ShowChallengeDetailState {
  const _LoadingCompetitors();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadingCompetitors);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ShowChallengeDetailState.loadingCompetitors()';
  }
}

/// @nodoc

class _LoadedCompetitors implements ShowChallengeDetailState {
  const _LoadedCompetitors({required final List<CompetitorInfo> competitors})
      : _competitors = competitors;

  final List<CompetitorInfo> _competitors;
  List<CompetitorInfo> get competitors {
    if (_competitors is EqualUnmodifiableListView) return _competitors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_competitors);
  }

  /// Create a copy of ShowChallengeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCompetitorsCopyWith<_LoadedCompetitors> get copyWith =>
      __$LoadedCompetitorsCopyWithImpl<_LoadedCompetitors>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadedCompetitors &&
            const DeepCollectionEquality()
                .equals(other._competitors, _competitors));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_competitors));

  @override
  String toString() {
    return 'ShowChallengeDetailState.loadedCompetitors(competitors: $competitors)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCompetitorsCopyWith<$Res>
    implements $ShowChallengeDetailStateCopyWith<$Res> {
  factory _$LoadedCompetitorsCopyWith(
          _LoadedCompetitors value, $Res Function(_LoadedCompetitors) _then) =
      __$LoadedCompetitorsCopyWithImpl;
  @useResult
  $Res call({List<CompetitorInfo> competitors});
}

/// @nodoc
class __$LoadedCompetitorsCopyWithImpl<$Res>
    implements _$LoadedCompetitorsCopyWith<$Res> {
  __$LoadedCompetitorsCopyWithImpl(this._self, this._then);

  final _LoadedCompetitors _self;
  final $Res Function(_LoadedCompetitors) _then;

  /// Create a copy of ShowChallengeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? competitors = null,
  }) {
    return _then(_LoadedCompetitors(
      competitors: null == competitors
          ? _self._competitors
          : competitors // ignore: cast_nullable_to_non_nullable
              as List<CompetitorInfo>,
    ));
  }
}

/// @nodoc

class _Error implements ShowChallengeDetailState {
  const _Error({required this.message});

  final String message;

  /// Create a copy of ShowChallengeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'ShowChallengeDetailState.error(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $ShowChallengeDetailStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of ShowChallengeDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_Error(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
