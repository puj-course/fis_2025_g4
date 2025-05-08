import 'package:top_app/shared/entities/templates/proof.dart';
import 'package:top_app/shared/entities/user_specific/user_proof.dart';

class ValidateProofFieldsUseCase {
  String? call({
    required UserProof proof,
    required Proof template,
  }) {
    if ((template.type == ProofType.text || template.type == ProofType.textAndImage) &&
        (proof.submittedText?.trim().isEmpty ?? true)) {
      return 'Please enter your proof text';
    }

    if ((template.type == ProofType.image || template.type == ProofType.textAndImage) &&
        proof.localImagePaths.isEmpty) {
      return 'Please upload an image';
    }

    return null; // No errors
  }
}
