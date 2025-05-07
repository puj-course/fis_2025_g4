import 'package:injectable/injectable.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/challenge_detail/data/models/competitor_info_model.dart';
import 'package:top_app/shared/cloud_functions/cloud_functions_helper.dart';

@injectable
class ChallengeDetailDataProvider {
  final CloudFunctionsHelper _cloudFunctionsHelper;

  ChallengeDetailDataProvider({
    required CloudFunctionsHelper cloudFunctionsHelper,
  }) : _cloudFunctionsHelper = cloudFunctionsHelper;

  Future<List<CompetitorInfoModel>> getCompetitorInfo(String challengeId) async {
    try {
      final response = await _cloudFunctionsHelper.callFunction(
        functionName: 'get_users_with_challenge',
        method: HttpMethod.post,
        body: {'challengeId': challengeId},
      );

      // Extract the users list from the response
      final List<dynamic> usersList = response['users'] as List<dynamic>;

      // Convert each user map to CompetitorInfoModel
      return usersList.map((userMap) => CompetitorInfoModel.fromJson(userMap)).toList();
    } catch (e) {
      throw Exception('Failed to get competitor info: $e');
    }
  }
}
