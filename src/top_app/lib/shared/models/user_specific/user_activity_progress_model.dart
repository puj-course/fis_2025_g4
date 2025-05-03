import 'package:top_app/shared/entities/user_specific/user_proof.dart';

import '../../entities/user_specific/user_activity_progress.dart';
import 'user_proof_model.dart';

class UserActivityProgressModel {
  final String activityId;
  final int currentStreak;
  final Map<String, UserProofModel> dailyProofs;

  UserActivityProgressModel({
    required this.activityId,
    required this.currentStreak,
    required this.dailyProofs,
  });

  factory UserActivityProgressModel.fromEntity(UserActivityProgress entity) {
    return UserActivityProgressModel(
      activityId: entity.activityId,
      currentStreak: entity.currentStreak,
      dailyProofs: entity.dailyProofs.map(
        (DateTime key, UserProof value) => MapEntry(
          key.toIso8601String(),
          UserProofModel.fromEntity(value),
        ),
      ),
    );
  }

  UserActivityProgress toEntity() {
    return UserActivityProgress(
      activityId: activityId,
      currentStreak: currentStreak,
      dailyProofs: dailyProofs.map(
        (String key, UserProofModel value) => MapEntry(
          DateTime.parse(key),
          value.toEntity(),
        ),
      ),
    );
  }

  factory UserActivityProgressModel.fromJson(Map<String, dynamic> json) {
    return UserActivityProgressModel(
      activityId: json['activityId'],
      currentStreak: json['currentStreak'],
      dailyProofs: (json['dailyProofs'] as Map<String, dynamic>).map(
        (String key, dynamic value) => MapEntry(
          key,
          UserProofModel.fromJson(value),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'activityId': activityId,
      'currentStreak': currentStreak,
      'dailyProofs': dailyProofs.map(
        (String key, UserProofModel value) => MapEntry(key, value.toJson()),
      ),
    };
  }
}
