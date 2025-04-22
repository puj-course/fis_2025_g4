import 'package:top_app/shared/models/templates/challenge_model.dart';

abstract class HomeRepository {
  /// Get the challenges that the user is participating in
  Future<List<ChallengeModel>> getUserChallenges(List<String> challengeIds);
}
