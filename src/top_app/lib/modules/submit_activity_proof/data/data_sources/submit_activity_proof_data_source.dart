import 'package:cloud_firestore/cloud_firestore.dart';
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

  Future<Map<String, dynamic>> getActivityTemplate({required String activityId}) async {
    final QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firebaseProvider.firestore
        .collection('activities')
        .where('id', isEqualTo: activityId)
        .get();

    if (querySnapshot.docs.isEmpty) {
      throw Exception('Activity with id $activityId not found');
    }

    return querySnapshot.docs.first.data();
  }

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
