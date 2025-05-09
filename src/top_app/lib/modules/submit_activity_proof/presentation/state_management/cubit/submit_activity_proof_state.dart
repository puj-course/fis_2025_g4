part of 'submit_activity_proof_cubit.dart';

@freezed
class SubmitActivityProofState with _$SubmitActivityProofState {
  const factory SubmitActivityProofState.initial() = _Initial;

  const factory SubmitActivityProofState.loadingProofDetails() = LoadingProofDetails;

  const factory SubmitActivityProofState.proofDetailsLoaded() = ProofDetailsLoaded;

  const factory SubmitActivityProofState.uploadingImage() = UploadingImage;

  const factory SubmitActivityProofState.submittingProof() = SubmittingProof;

  const factory SubmitActivityProofState.imageUploaded() = ImageUploaded;

  const factory SubmitActivityProofState.proofSubmitted(bool isWithinTimeWindow) = ProofSubmitted;

  const factory SubmitActivityProofState.updatingProof() = UpdatingProof;

  const factory SubmitActivityProofState.proofUpdated() = ProofUpdated;

  const factory SubmitActivityProofState.error(String message, bool isInformational) = Error;
}
