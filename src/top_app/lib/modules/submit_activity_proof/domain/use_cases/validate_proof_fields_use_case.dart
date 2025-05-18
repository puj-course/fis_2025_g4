import 'package:top_app/modules/submit_activity_proof/domain/strategies/proof_validation_strategy.dart';
import 'package:top_app/shared/entities/templates/proof.dart';
import 'package:top_app/shared/entities/user_specific/user_proof.dart';
import '../strategies/proof_validation_strategy_factory.dart';

class ValidateProofFieldsUseCase {
  String? call({
    required UserProof proof,
    required Proof template,
  }) {
    final ProofValidationStrategy strategy =
        ProofValidationStrategyFactory.createStrategy(template);
    return strategy.validate(proof: proof, template: template);
  }
}
