import 'package:injectable/injectable.dart';
import 'package:top_app/core/providers/firebase_provider.dart';
import 'package:top_app/shared/image_helper/image_helper.dart';
import 'package:top_app/shared/models/user_specific/user_proof_model.dart';

@injectable
class SubmitActivityProofDataSource {
  final FirebaseProvider _firebaseProvider;
  final ImageHelper _imageHelper;

  SubmitActivityProofDataSource({
    required FirebaseProvider firebaseProvider,
    required ImageHelper imageHelper,
  })  : _firebaseProvider = firebaseProvider,
        _imageHelper = imageHelper;

  Future<void> submitActivityProof({
    required String userId,
    required String challengeId,
    required String activityId,
    required UserProofModel proof,
  }) async {
    final DateTime now = DateTime.now();
    final String proofPath =
        'users/$userId/challenges/$challengeId/activities/$activityId/dailyProofs/${now.millisecondsSinceEpoch}';

    await _firebaseProvider.firestore.doc(proofPath).set(proof.toJson());
  }

  Future<String> uploadImage(String path, String imagePath) async {
    return await _imageHelper.uploadImage(path, imagePath);
  }
}
