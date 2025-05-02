import 'package:injectable/injectable.dart';
import 'package:top_app/modules/submit_activity_proof/data/data_sources/submit_activity_proof_data_source.dart';
import 'package:top_app/modules/submit_activity_proof/domain/repository/submit_activity_proof_repository.dart';
import 'package:top_app/shared/entities/user_specific/user_proof.dart';
import 'package:top_app/shared/global_state/user/api/user_public_api.dart';
import 'package:top_app/shared/global_state/user/domain/entity/user_entity.dart';
import 'package:top_app/shared/models/user_specific/user_proof_model.dart';

@Injectable(as: SubmitActivityProofRepository)
class SubmitActivityProofRepositoryImpl implements SubmitActivityProofRepository {
  final SubmitActivityProofDataSource _dataSource;
  final UserPublicApi _userPublicApi;

  SubmitActivityProofRepositoryImpl({
    required SubmitActivityProofDataSource dataSource,
    required UserPublicApi userPublicApi,
  })  : _dataSource = dataSource,
        _userPublicApi = userPublicApi;

  @override
  Future<void> submitActivityProof({
    required String activityId,
    required String challengeId,
    required UserProof proof,
  }) async {
    final UserEntity? user = await _userPublicApi.getUser();
    if (user == null) {
      throw Exception('User not found');
    }

    final UserProofModel proofModel = UserProofModel.fromEntity(proof);

    await _dataSource.submitActivityProof(
      userId: user.uid,
      activityId: activityId,
      challengeId: challengeId,
      proof: proofModel,
    );
  }

  @override
  Future<String> uploadImage(String imagePath) async {
    final UserEntity? user = await _userPublicApi.getUser();
    if (user == null) {
      throw Exception('User not found');
    }

    final String path = 'users/${user.uid}/dailyProofs/${DateTime.now().millisecondsSinceEpoch}';

    return await _dataSource.uploadImage(path, imagePath);
  }
}
