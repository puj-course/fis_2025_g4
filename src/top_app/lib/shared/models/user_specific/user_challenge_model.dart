import '../../entities/user_specific/user_challenge.dart';
import 'user_activity_model.dart';

class UserChallengeModel {
  final String userId;
  final String challengeId;
  final DateTime dateStarted;
  final int currentStreak;
  final int bestStreak;
  final double completion;
  final List<UserActivityModel> activities;

  UserChallengeModel({
    required this.userId,
    required this.challengeId,
    required this.dateStarted,
    required this.currentStreak,
    required this.bestStreak,
    required this.completion,
    required this.activities,
  });

  factory UserChallengeModel.fromEntity(UserChallenge entity) {
    return UserChallengeModel(
      userId: entity.userId,
      challengeId: entity.challengeId,
      dateStarted: entity.dateStarted,
      currentStreak: entity.currentStreak,
      bestStreak: entity.bestStreak,
      completion: entity.completion,
      activities: entity.activities.map((a) => UserActivityModel.fromEntity(a)).toList(),
    );
  }

  UserChallenge toEntity() {
    return UserChallenge(
      userId: userId,
      challengeId: challengeId,
      dateStarted: dateStarted,
      currentStreak: currentStreak,
      bestStreak: bestStreak,
      completion: completion,
      activities: activities.map((a) => a.toEntity()).toList(),
    );
  }

  factory UserChallengeModel.fromJson(Map<String, dynamic> json) {
    return UserChallengeModel(
      userId: json['userId'],
      challengeId: json['challengeId'],
      dateStarted: DateTime.parse(json['dateStarted']),
      currentStreak: json['currentStreak'],
      bestStreak: json['bestStreak'],
      completion: json['completion'].toDouble(),
      activities: (json['activities'] as List).map((a) => UserActivityModel.fromJson(a)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'challengeId': challengeId,
      'dateStarted': dateStarted.toIso8601String(),
      'currentStreak': currentStreak,
      'bestStreak': bestStreak,
      'completion': completion,
      'activities': activities.map((a) => a.toJson()).toList(),
    };
  }
}
