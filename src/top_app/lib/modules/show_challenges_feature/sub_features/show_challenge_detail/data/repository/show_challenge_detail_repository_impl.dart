import 'package:injectable/injectable.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenge_detail/data/data_provider/show_challenge_detail_data_provider.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenge_detail/data/models/competitor_info_model.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenge_detail/domain/entities/competitor_info.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenge_detail/domain/repository/show_challenge_detail_repository.dart';

@Injectable(as: ShowChallengeDetailRepository)
class ShowChallengeDetailRepositoryImpl implements ShowChallengeDetailRepository {
  final ShowChallengeDetailDataProvider _showChallengeDetailDataProvider;

  ShowChallengeDetailRepositoryImpl(
      {required ShowChallengeDetailDataProvider showChallengeDetailDataProvider})
      : _showChallengeDetailDataProvider = showChallengeDetailDataProvider;

  @override
  Future<List<CompetitorInfo>> getCompetitorsInfo(String challengeId) async {
    try {
      if (challengeId.isEmpty) {
        throw Exception('Challenge ID cannot be empty');
      }

      final List<CompetitorInfoModel> competitorInfoModels =
          await _showChallengeDetailDataProvider.getCompetitorInfo(challengeId);

      return competitorInfoModels.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to get competitors info: $e');
    }
  }
}
