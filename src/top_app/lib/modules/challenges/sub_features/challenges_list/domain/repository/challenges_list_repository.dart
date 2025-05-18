import 'package:top_app/shared/entities/templates/challenge.dart';

abstract class ChallengesListRepository {
  /// Get all challenges from the database
  Future<List<Challenge>> getChallenges();
}
