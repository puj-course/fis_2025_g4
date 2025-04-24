import 'package:top_app/shared/entities/user_specific/user_activity_progress.dart';

import '../../entities/user_specific/user_challenge.dart';
import 'user_activity_progress_model.dart';

class UserChallengeModel {
  final String challengeId;
  final DateTime dateStarted;
  final int currentStreak;
  final int bestStreak;
  final double completion;
  final List<UserActivityProgressModel> activities;

  UserChallengeModel({
    required this.challengeId,
    required this.dateStarted,
    required this.currentStreak,
    required this.bestStreak,
    required this.completion,
    required this.activities,
  });

  factory UserChallengeModel.fromEntity(UserChallenge entity) {
    return UserChallengeModel(
      challengeId: entity.challengeId,
      dateStarted: entity.dateStarted,
      currentStreak: entity.currentStreak,
      bestStreak: entity.bestStreak,
      completion: entity.completion,
      activities: entity.activities
          .map((UserActivityProgress a) => UserActivityProgressModel.fromEntity(a))
          .toList(),
    );
  }

  UserChallenge toEntity() {
    return UserChallenge(
      challengeId: challengeId,
      dateStarted: dateStarted,
      currentStreak: currentStreak,
      bestStreak: bestStreak,
      completion: completion,
      activities: activities.map((UserActivityProgressModel a) => a.toEntity()).toList(),
    );
  }

  factory UserChallengeModel.fromJson(Map<String, dynamic> json) {
    return UserChallengeModel(
      challengeId: json['challengeId'],
      dateStarted: DateTime.parse(json['dateStarted']),
      currentStreak: json['currentStreak'],
      bestStreak: json['bestStreak'],
      completion: json['completion'].toDouble(),
      activities:
          (json['activities'] as List).map((a) => UserActivityProgressModel.fromJson(a)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'challengeId': challengeId,
      'dateStarted': dateStarted.toIso8601String(),
      'currentStreak': currentStreak,
      'bestStreak': bestStreak,
      'completion': completion,
      'activities': activities.map((UserActivityProgressModel a) => a.toJson()).toList(),
    };
  }
}
