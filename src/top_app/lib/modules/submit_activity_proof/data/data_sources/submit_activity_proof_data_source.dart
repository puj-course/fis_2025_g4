import 'package:injectable/injectable.dart';
import 'package:top_app/shared/image_helper/image_helper.dart';
import 'package:top_app/shared/models/user_specific/user_proof_model.dart';
import 'package:top_app/shared/cloud_functions/cloud_functions_helper.dart';

@injectable
class SubmitActivityProofDataSource {
  final ImageHelper _imageHelper;
  final CloudFunctionsHelper _cloudFunctionsHelper;

  SubmitActivityProofDataSource({
    required ImageHelper imageHelper,
    required CloudFunctionsHelper cloudFunctionsHelper,
  })  : _imageHelper = imageHelper,
        _cloudFunctionsHelper = cloudFunctionsHelper;

  Future<void> submitActivityProof({
    required String userId,
    required String challengeId,
    required String activityId,
    required UserProofModel proof,
  }) async {
    await _cloudFunctionsHelper.callFunction(
      functionName: 'submit_activity_proof',
      method: HttpMethod.post,
      body: <String, dynamic>{
        'userId': userId,
        'challengeId': challengeId,
        'activityId': activityId,
        'proof': proof.toJson(),
      },
    );
  }

  Future<String> uploadImage(String path, String imagePath) async {
    return await _imageHelper.uploadImage(path, imagePath);
  }
}
