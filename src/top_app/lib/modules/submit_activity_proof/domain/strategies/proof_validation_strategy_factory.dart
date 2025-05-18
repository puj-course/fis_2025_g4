import 'package:top_app/shared/entities/templates/proof.dart';
import 'proof_validation_strategy.dart';
import 'text_proof_validation_strategy.dart';
import 'image_proof_validation_strategy.dart';
import 'text_and_image_proof_validation_strategy.dart';
import 'time_based_proof_validation_strategy.dart';

/// Factory for creating proof validation strategies based on proof type
class ProofValidationStrategyFactory {
  /// Creates the appropriate validation strategy for the given proof type
  static ProofValidationStrategy createStrategy(Proof template) {
    ProofValidationStrategy baseStrategy;

    switch (template.type) {
      case ProofType.text:
        baseStrategy = TextProofValidationStrategy();
        break;
      case ProofType.image:
        baseStrategy = ImageProofValidationStrategy();
        break;
      case ProofType.textAndImage:
        baseStrategy = TextAndImageProofValidationStrategy();
        break;
    }

    // If the proof is time-based, wrap the base strategy
    if (template.timeBased) {
      return TimeBasedProofValidationStrategy(baseStrategy);
    }

    return baseStrategy;
  }
}

/// Exception thrown when an unsupported proof type is encountered
class UnsupportedProofTypeException implements Exception {
  final ProofType type;

  UnsupportedProofTypeException(this.type);

  @override
  String toString() => 'Unsupported proof type: $type';
}
