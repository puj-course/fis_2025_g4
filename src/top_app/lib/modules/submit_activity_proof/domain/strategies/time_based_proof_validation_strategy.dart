import 'package:top_app/shared/entities/templates/proof.dart';
import 'package:top_app/shared/entities/user_specific/user_proof.dart';
import 'proof_validation_strategy.dart';

/// Strategy for validating time-based proofs
/// This strategy wraps another strategy and adds time-based validation
class TimeBasedProofValidationStrategy implements ProofValidationStrategy {
  final ProofValidationStrategy _baseStrategy;

  TimeBasedProofValidationStrategy(this._baseStrategy);

  @override
  String? validate({
    required UserProof proof,
    required Proof template,
  }) {
    // First validate the base proof type
    final String? baseValidation = _baseStrategy.validate(proof: proof, template: template);
    if (baseValidation != null) {
      return baseValidation;
    }

    return null;
  }
}
