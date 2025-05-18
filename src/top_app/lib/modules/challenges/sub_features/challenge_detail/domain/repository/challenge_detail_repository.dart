import 'package:top_app/modules/challenges/sub_features/challenge_detail/domain/entities/competitor_info.dart';

abstract class ChallengeDetailRepository {
  Future<List<CompetitorInfo>> getCompetitorsInfo(String challengeId);

  Future<void> joinChallenge(String challengeId);
}
