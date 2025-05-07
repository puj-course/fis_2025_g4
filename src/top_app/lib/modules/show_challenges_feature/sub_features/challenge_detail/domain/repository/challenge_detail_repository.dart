import 'package:top_app/modules/show_challenges_feature/sub_features/challenge_detail/domain/entities/competitor_info.dart';

abstract class ChallengeDetailRepository {
  Future<List<CompetitorInfo>> getCompetitorsInfo(String challengeId);
}
