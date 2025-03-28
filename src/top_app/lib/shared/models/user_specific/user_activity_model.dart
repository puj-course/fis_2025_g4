import '../../entities/user_specific/user_activity.dart';
import 'user_proof_model.dart';

class UserActivityModel {
  final String activityName;
  final int currentStreak;
  final double completion;
  final List<UserProofModel> proofs;

  UserActivityModel({
    required this.activityName,
    required this.currentStreak,
    required this.completion,
    required this.proofs,
  });

  factory UserActivityModel.fromEntity(UserActivity entity) {
    return UserActivityModel(
      activityName: entity.activityName,
      currentStreak: entity.currentStreak,
      completion: entity.completion,
      proofs: entity.proofs.map((p) => UserProofModel.fromEntity(p)).toList(),
    );
  }

  UserActivity toEntity() {
    return UserActivity(
      activityName: activityName,
      currentStreak: currentStreak,
      completion: completion,
      proofs: proofs.map((p) => p.toEntity()).toList(),
    );
  }

  factory UserActivityModel.fromJson(Map<String, dynamic> json) {
    return UserActivityModel(
      activityName: json['activityName'],
      currentStreak: json['currentStreak'],
      completion: json['completion'].toDouble(),
      proofs: (json['proofs'] as List).map((p) => UserProofModel.fromJson(p)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'activityName': activityName,
      'currentStreak': currentStreak,
      'completion': completion,
      'proofs': proofs.map((p) => p.toJson()).toList(),
    };
  }
}
