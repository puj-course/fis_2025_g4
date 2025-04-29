part of 'submit_activity_proof_cubit.dart';

@freezed
class SubmitActivityProofState with _$SubmitActivityProofState {
  const factory SubmitActivityProofState.initial() = _Initial;

  const factory SubmitActivityProofState.loadingProofDetails() = LoadingProofDetails;

  const factory SubmitActivityProofState.proofDetailsLoaded() = ProofDetailsLoaded;

  const factory SubmitActivityProofState.uploadingImage() = UploadingImage;

  const factory SubmitActivityProofState.submittingProof() = SubmittingProof;

  const factory SubmitActivityProofState.imageUploaded() = ImageUploaded;

  const factory SubmitActivityProofState.proofSubmitted() = ProofSubmitted;

  const factory SubmitActivityProofState.error(String message) = Error;
}
