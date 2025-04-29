import 'package:injectable/injectable.dart';
import 'package:top_app/core/providers/firebase_provider.dart';
import 'package:top_app/shared/image_helper/image_helper.dart';
import 'package:top_app/shared/models/user_specific/user_proof_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    final DocumentReference<Map<String, dynamic>> userDoc =
        _firebaseProvider.firestore.collection('users').doc(userId);

    await userDoc.update(<Object, Object?>{
      'challenges.$challengeId.activities.$activityId.dailyProofs':
          FieldValue.arrayUnion(<Map<String, dynamic>>[proof.toJson()])
    });
  }

  Future<String> uploadImage(String path, String imagePath) async {
    return await _imageHelper.uploadImage(path, imagePath);
  }
}
