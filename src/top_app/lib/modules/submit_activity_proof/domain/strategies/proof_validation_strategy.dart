import 'package:top_app/shared/entities/templates/proof.dart';
import 'package:top_app/shared/entities/user_specific/user_proof.dart';

/// Abstract strategy interface for proof validation
abstract class ProofValidationStrategy {
  /// Validates the proof based on the template requirements
  /// Returns null if validation passes, or an error message if it fails
  String? validate({
    required UserProof proof,
    required Proof template,
  });
}
