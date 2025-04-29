import 'package:top_app/shared/entities/user_specific/user_activity_progress.dart';
import 'package:top_app/shared/entities/user_specific/user_proof.dart';

abstract class SubmitActivityProofRepository {
  Future<void> submitActivityProof({
    required String challengeId,
    required String activityId,
    required UserProof proof,
  });

  Future<UserActivityProgress> getActivityTemplate({required String activityId});
}
