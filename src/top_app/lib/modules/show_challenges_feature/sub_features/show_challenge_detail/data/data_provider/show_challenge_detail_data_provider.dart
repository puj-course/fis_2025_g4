import 'package:injectable/injectable.dart';
import 'package:top_app/core/providers/firebase_provider.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenge_detail/data/models/competitor_info_model.dart';

@injectable
class ShowChallengeDetailDataProvider {
  final FirebaseProvider _firebaseProvider;

  ShowChallengeDetailDataProvider({required FirebaseProvider firebaseProvider})
      : _firebaseProvider = firebaseProvider;

  Future<List<CompetitorInfoModel>> getCompetitorInfo(String challengeId) async {
    try {
      // Call the Cloud Function
      final callable = _firebaseProvider.functions.httpsCallable('get_users_with_challenge');
      final result = await callable.call({
        'challengeId': challengeId,
      });

      // Extract the users list from the response
      final List<dynamic> usersList = result.data['users'] as List<dynamic>;

      // Convert each user map to CompetitorInfoModel
      return usersList.map((userMap) => CompetitorInfoModel.fromJson(userMap)).toList();
    } catch (e) {
      throw Exception('Failed to get competitor info: $e');
    }
  }
}
