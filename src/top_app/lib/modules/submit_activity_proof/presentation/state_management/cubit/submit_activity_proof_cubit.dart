import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/modules/submit_activity_proof/domain/repository/submit_activity_proof_repository.dart';
import 'package:top_app/shared/entities/templates/activity.dart';
import 'package:top_app/shared/entities/templates/proof.dart';
import 'package:top_app/shared/entities/user_specific/user_proof.dart';

part 'submit_activity_proof_state.dart';
part 'submit_activity_proof_cubit.freezed.dart';

@injectable
class SubmitActivityProofCubit extends Cubit<SubmitActivityProofState> {
  final SubmitActivityProofRepository _submitActivityProofRepository;

  SubmitActivityProofCubit({required SubmitActivityProofRepository submitActivityProofRepository})
      : _submitActivityProofRepository = submitActivityProofRepository,
        super(SubmitActivityProofState.initial());

  late UserProof userProof;
  late Proof proofTemplate;
  late String challengeId;
  late String activityId;

  Future<void> loadUserProof(Activity activity) async {
    emit(SubmitActivityProofState.loadingProofDetails());

    challengeId = activity.challengeId;
    activityId = activity.id;

    proofTemplate = activity.proof.first;

    userProof = UserProof(
      proofId: proofTemplate.id,
      type: proofTemplate.type,
      submittedImageUrls: <String>[],
      localImagePaths: <String>[],
      submittedText: '',
      submittedAt: DateTime.now(),
      isValid: true,
    );

    emit(SubmitActivityProofState.proofDetailsLoaded());
  }

  Future<void> updateImage(String imagePath) async {
    emit(SubmitActivityProofState.updatingProof());
    userProof = userProof.copyWith(
      localImagePaths: <String>[imagePath],
    );
    emit(SubmitActivityProofState.proofUpdated());
  }

  Future<void> removeImage() async {
    emit(SubmitActivityProofState.updatingProof());
    userProof = userProof.copyWith(
      submittedImageUrls: <String>[],
      localImagePaths: <String>[],
    );
    emit(SubmitActivityProofState.proofUpdated());
  }

  Future<void> submitProof() async {
    // Validate required fields based on proof type
    if (proofTemplate.type == ProofType.text || proofTemplate.type == ProofType.textAndImage) {
      if (userProof.submittedText?.isEmpty ?? true) {
        emit(SubmitActivityProofState.error('Please enter your proof text', true));
        return;
      }
    }

    if (proofTemplate.type == ProofType.image || proofTemplate.type == ProofType.textAndImage) {
      if (userProof.localImagePaths.isEmpty) {
        emit(SubmitActivityProofState.error('Please upload an image', true));
        return;
      }
    }

    emit(SubmitActivityProofState.submittingProof());
    try {
      // Upload image if there's a local path
      if (userProof.localImagePaths.isNotEmpty) {
        final String downloadUrl =
            await _submitActivityProofRepository.uploadImage(userProof.localImagePaths.first);
        userProof = userProof.copyWith(
          submittedImageUrls: <String>[downloadUrl],
        );
      }

      // Time based check
      if (proofTemplate.timeBased) {
        final TimeOfDay now = TimeOfDay.fromDateTime(DateTime.now());

        if (now.isBefore(proofTemplate.proofStartTime!) ||
            now.isAfter(proofTemplate.proofEndTime!)) {
          emit(SubmitActivityProofState.error('Proof submitted outside of time window', true));

          userProof = userProof.copyWith(isValid: false);
        }
      }

      await _submitActivityProofRepository.submitActivityProof(
        activityId: activityId,
        challengeId: challengeId,
        proof: userProof,
      );
      emit(SubmitActivityProofState.proofSubmitted());
    } catch (e) {
      emit(SubmitActivityProofState.error(e.toString(), false));
    }
  }

  void updateProofText(String text) {
    emit(SubmitActivityProofState.updatingProof());
    userProof = userProof.copyWith(submittedText: text);
    emit(SubmitActivityProofState.proofUpdated());
  }
}
