// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'submit_activity_proof_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SubmitActivityProofState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SubmitActivityProofState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubmitActivityProofState()';
  }
}

/// @nodoc
class $SubmitActivityProofStateCopyWith<$Res> {
  $SubmitActivityProofStateCopyWith(
      SubmitActivityProofState _, $Res Function(SubmitActivityProofState) __);
}

/// @nodoc

class _Initial implements SubmitActivityProofState {
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
    return 'SubmitActivityProofState.initial()';
  }
}

/// @nodoc

class LoadingProofDetails implements SubmitActivityProofState {
  const LoadingProofDetails();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoadingProofDetails);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubmitActivityProofState.loadingProofDetails()';
  }
}

/// @nodoc

class ProofDetailsLoaded implements SubmitActivityProofState {
  const ProofDetailsLoaded();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProofDetailsLoaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubmitActivityProofState.proofDetailsLoaded()';
  }
}

/// @nodoc

class UploadingImage implements SubmitActivityProofState {
  const UploadingImage();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UploadingImage);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubmitActivityProofState.uploadingImage()';
  }
}

/// @nodoc

class SubmittingProof implements SubmitActivityProofState {
  const SubmittingProof();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SubmittingProof);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubmitActivityProofState.submittingProof()';
  }
}

/// @nodoc

class ImageUploaded implements SubmitActivityProofState {
  const ImageUploaded();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ImageUploaded);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubmitActivityProofState.imageUploaded()';
  }
}

/// @nodoc

class ProofSubmitted implements SubmitActivityProofState {
  const ProofSubmitted(this.isWithinTimeWindow);

  final bool isWithinTimeWindow;

  /// Create a copy of SubmitActivityProofState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProofSubmittedCopyWith<ProofSubmitted> get copyWith =>
      _$ProofSubmittedCopyWithImpl<ProofSubmitted>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProofSubmitted &&
            (identical(other.isWithinTimeWindow, isWithinTimeWindow) ||
                other.isWithinTimeWindow == isWithinTimeWindow));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isWithinTimeWindow);

  @override
  String toString() {
    return 'SubmitActivityProofState.proofSubmitted(isWithinTimeWindow: $isWithinTimeWindow)';
  }
}

/// @nodoc
abstract mixin class $ProofSubmittedCopyWith<$Res>
    implements $SubmitActivityProofStateCopyWith<$Res> {
  factory $ProofSubmittedCopyWith(
          ProofSubmitted value, $Res Function(ProofSubmitted) _then) =
      _$ProofSubmittedCopyWithImpl;
  @useResult
  $Res call({bool isWithinTimeWindow});
}

/// @nodoc
class _$ProofSubmittedCopyWithImpl<$Res>
    implements $ProofSubmittedCopyWith<$Res> {
  _$ProofSubmittedCopyWithImpl(this._self, this._then);

  final ProofSubmitted _self;
  final $Res Function(ProofSubmitted) _then;

  /// Create a copy of SubmitActivityProofState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isWithinTimeWindow = null,
  }) {
    return _then(ProofSubmitted(
      null == isWithinTimeWindow
          ? _self.isWithinTimeWindow
          : isWithinTimeWindow // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class UpdatingProof implements SubmitActivityProofState {
  const UpdatingProof();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is UpdatingProof);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubmitActivityProofState.updatingProof()';
  }
}

/// @nodoc

class ProofUpdated implements SubmitActivityProofState {
  const ProofUpdated();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProofUpdated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SubmitActivityProofState.proofUpdated()';
  }
}

/// @nodoc

class Error implements SubmitActivityProofState {
  const Error(this.message, this.isInformational);

  final String message;
  final bool isInformational;

  /// Create a copy of SubmitActivityProofState
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
            (identical(other.isInformational, isInformational) ||
                other.isInformational == isInformational));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message, isInformational);

  @override
  String toString() {
    return 'SubmitActivityProofState.error(message: $message, isInformational: $isInformational)';
  }
}

/// @nodoc
abstract mixin class $ErrorCopyWith<$Res>
    implements $SubmitActivityProofStateCopyWith<$Res> {
  factory $ErrorCopyWith(Error value, $Res Function(Error) _then) =
      _$ErrorCopyWithImpl;
  @useResult
  $Res call({String message, bool isInformational});
}

/// @nodoc
class _$ErrorCopyWithImpl<$Res> implements $ErrorCopyWith<$Res> {
  _$ErrorCopyWithImpl(this._self, this._then);

  final Error _self;
  final $Res Function(Error) _then;

  /// Create a copy of SubmitActivityProofState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? isInformational = null,
  }) {
    return _then(Error(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      null == isInformational
          ? _self.isInformational
          : isInformational // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
