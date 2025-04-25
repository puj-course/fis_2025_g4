import 'package:top_app/shared/entities/user_specific/user_proof.dart';

import '../../entities/user_specific/user_activity_progress.dart';
import 'user_proof_model.dart';

class UserActivityProgressModel {
  final String activityId;
  final int currentStreak;
  final double completion;
  final Map<DateTime, UserProofModel> dailyProofs;

  UserActivityProgressModel({
    required this.activityId,
    required this.currentStreak,
    required this.completion,
    required this.dailyProofs,
  });

  factory UserActivityProgressModel.fromEntity(UserActivityProgress entity) {
    return UserActivityProgressModel(
      activityId: entity.activityId,
      currentStreak: entity.currentStreak,
      completion: entity.completion,
      dailyProofs: entity.dailyProofs.map(
        (DateTime key, UserProof value) => MapEntry(key, UserProofModel.fromEntity(value)),
      ),
    );
  }

  UserActivityProgress toEntity() {
    return UserActivityProgress(
      activityId: activityId,
      currentStreak: currentStreak,
      completion: completion,
      dailyProofs: dailyProofs.map(
        (DateTime key, UserProofModel value) => MapEntry(key, value.toEntity()),
      ),
    );
  }

  factory UserActivityProgressModel.fromJson(Map<String, dynamic> json) {
    return UserActivityProgressModel(
      activityId: json['activityId'],
      currentStreak: json['currentStreak'],
      completion: json['completion'].toDouble(),
      dailyProofs: (json['dailyProofs'] as Map<String, dynamic>).map(
        (String key, dynamic value) => MapEntry<DateTime, UserProofModel>(
          DateTime.parse(key),
          UserProofModel.fromJson(value),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'activityId': activityId,
      'currentStreak': currentStreak,
      'completion': completion,
      'dailyProofs': dailyProofs.map(
        (DateTime key, UserProofModel value) => MapEntry<String, dynamic>(
          key.toIso8601String(),
          value.toJson(),
        ),
      ),
    };
  }
}
