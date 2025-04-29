import 'package:top_app/shared/entities/user_specific/user_activity_progress.dart';
import 'package:top_app/shared/entities/user_specific/user_proof.dart';

abstract class SubmitActivityProofRepository {
  /// Submits a proof for a specific activity of the user.
  Future<void> submitActivityProof({
    required String challengeId,
    required String activityId,
    required UserProof proof,
  });

  /// Retrieves the template for a specific activity.
  Future<UserActivityProgress> getActivityTemplate({required String activityId});

  /// Uploads a proof image to Firebase Storage and returns the download URL.
  Future<String> uploadImage(String imagePath);
}
