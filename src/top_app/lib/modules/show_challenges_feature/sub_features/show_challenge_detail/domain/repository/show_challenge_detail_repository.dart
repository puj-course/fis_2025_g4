import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenge_detail/domain/entities/competitor_info.dart';

abstract class ShowChallengeDetailRepository {
  Future<List<CompetitorInfo>> getCompetitorsInfo(String challengeId);
}
