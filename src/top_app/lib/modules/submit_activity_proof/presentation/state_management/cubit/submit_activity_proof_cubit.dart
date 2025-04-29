import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/modules/submit_activity_proof/domain/repository/submit_activity_proof_repository.dart';
import 'package:top_app/shared/entities/templates/activity.dart';
import 'package:top_app/shared/entities/user_specific/user_activity_progress.dart';
import 'package:top_app/shared/entities/user_specific/user_proof.dart';

part 'submit_activity_proof_state.dart';
part 'submit_activity_proof_cubit.freezed.dart';

@injectable
class SubmitActivityProofCubit extends Cubit<SubmitActivityProofState> {
  final SubmitActivityProofRepository _submitActivityProofRepository;

  SubmitActivityProofCubit({required SubmitActivityProofRepository submitActivityProofRepository})
      : _submitActivityProofRepository = submitActivityProofRepository,
        super(SubmitActivityProofState.initial());

  late UserProof proof;
  late String challengeId;
  late String activityId;

  Future<void> loadUserProof(Activity activity, String challengeId) async {
    emit(SubmitActivityProofState.loadingProofDetails());

    this.challengeId = challengeId;
    activityId = activity.id;

    proof = UserProof(
      type: activity.proof.first.type,
      submittedImageUrls: <String>[],
      submittedText: '',
      submittedAt: DateTime.now(),
      isValid: false,
    );

    emit(SubmitActivityProofState.proofDetailsLoaded());
  }

  Future<void> uploadImage(String imagePath) async {
    emit(SubmitActivityProofState.uploadingImage());
    try {
      final String downloadUrl = await _submitActivityProofRepository.uploadImage(imagePath);
      proof.submittedImageUrls.add(downloadUrl);
      emit(SubmitActivityProofState.imageUploaded());
    } catch (e) {
      emit(SubmitActivityProofState.error(e.toString()));
    }
  }

  Future<void> submitProof() async {
    emit(SubmitActivityProofState.submittingProof());
    try {
      await _submitActivityProofRepository.submitActivityProof(
        activityId: activityId,
        challengeId: challengeId,
        proof: proof,
      );
      emit(SubmitActivityProofState.proofSubmitted());
    } catch (e) {
      emit(SubmitActivityProofState.error(e.toString()));
    }
    emit(SubmitActivityProofState.proofSubmitted());
  }
}
