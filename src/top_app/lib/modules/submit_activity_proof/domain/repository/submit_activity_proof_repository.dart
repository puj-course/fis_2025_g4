import 'package:top_app/shared/entities/user_specific/user_proof.dart';

abstract class SubmitActivityProofRepository {
  /// Submits a proof for a specific activity of the user.
  Future<void> submitActivityProof({
    required String challengeId,
    required String activityId,
    required UserProof proof,
  });

  /// Uploads a proof image to Firebase Storage and returns the download URL.
  Future<String> uploadImage(String imagePath);
}
