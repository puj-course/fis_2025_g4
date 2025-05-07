import 'package:injectable/injectable.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/challenge_detail/data/data_provider/challenge_detail_data_provider.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/challenge_detail/data/models/competitor_info_model.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/challenge_detail/domain/entities/competitor_info.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/challenge_detail/domain/repository/challenge_detail_repository.dart';

@Injectable(as: ChallengeDetailRepository)
class ChallengeDetailRepositoryImpl implements ChallengeDetailRepository {
  final ChallengeDetailDataProvider _showChallengeDetailDataProvider;

  ChallengeDetailRepositoryImpl(
      {required ChallengeDetailDataProvider showChallengeDetailDataProvider})
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
