import 'package:top_app/shared/entities/user_specific/user_proof.dart';

import '../../entities/user_specific/user_activity_progress.dart';
import 'user_proof_model.dart';

class UserActivityProgressModel {
  final String activityName;
  final int currentStreak;
  final double completion;
  final List<UserProofModel>? proofs;

  UserActivityProgressModel({
    required this.activityName,
    required this.currentStreak,
    required this.completion,
    required this.proofs,
  });

  factory UserActivityProgressModel.fromEntity(UserActivityProgress entity) {
    return UserActivityProgressModel(
      activityName: entity.activityName,
      currentStreak: entity.currentStreak,
      completion: entity.completion,
      proofs: entity.proofs?.map((UserProof p) => UserProofModel.fromEntity(p)).toList(),
    );
  }

  UserActivityProgress toEntity() {
    return UserActivityProgress(
      activityName: activityName,
      currentStreak: currentStreak,
      completion: completion,
      proofs: proofs?.map((UserProofModel p) => p.toEntity()).toList(),
    );
  }

  factory UserActivityProgressModel.fromJson(Map<String, dynamic> json) {
    return UserActivityProgressModel(
      activityName: json['activityName'],
      currentStreak: json['currentStreak'],
      completion: json['completion'].toDouble(),
      proofs: json['proofs'] != null
          ? (json['proofs'] as List).map((p) => UserProofModel.fromJson(p)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'activityName': activityName,
      'currentStreak': currentStreak,
      'completion': completion,
      'proofs': proofs?.map((UserProofModel p) => p.toJson()).toList(),
    };
  }
}
