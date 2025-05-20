import 'package:top_app/shared/entities/templates/proof.dart';
import 'package:top_app/shared/entities/user_specific/user_proof.dart';
import 'proof_validation_strategy.dart';

/// Strategy for validating text-based proofs
class TextProofValidationStrategy implements ProofValidationStrategy {
  @override
  String? validate({
    required UserProof proof,
    required Proof template,
  }) {
    if (proof.submittedText?.trim().isEmpty ?? true) {
      return 'Please enter your proof text';
    }
    return null;
  }
}
