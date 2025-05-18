import 'package:top_app/shared/entities/templates/proof.dart';
import 'package:top_app/shared/entities/user_specific/user_proof.dart';
import 'proof_validation_strategy.dart';

/// Strategy for validating proofs that require both text and image
class TextAndImageProofValidationStrategy implements ProofValidationStrategy {
  @override
  String? validate({
    required UserProof proof,
    required Proof template,
  }) {
    if (proof.submittedText?.trim().isEmpty ?? true) {
      return 'Please enter your proof text';
    }
    if (proof.localImagePaths.isEmpty) {
      return 'Please upload an image';
    }
    return null;
  }
}
