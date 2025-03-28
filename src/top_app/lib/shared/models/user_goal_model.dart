import '../entities/user_goal.dart';

class UserGoalModel {
  final String userId;
  final String goalId;
  final DateTime dateStarted;
  final double completion;

  UserGoalModel({
    required this.userId,
    required this.goalId,
    required this.dateStarted,
    required this.completion,
  });

  factory UserGoalModel.fromEntity(UserGoal entity) {
    return UserGoalModel(
      userId: entity.userId,
      goalId: entity.goalId,
      dateStarted: entity.dateStarted,
      completion: entity.completion,
    );
  }

  UserGoal toEntity() {
    return UserGoal(
      userId: userId,
      goalId: goalId,
      dateStarted: dateStarted,
      completion: completion,
    );
  }

  factory UserGoalModel.fromJson(Map<String, dynamic> json) {
    return UserGoalModel(
      userId: json['userId'],
      goalId: json['goalId'],
      dateStarted: DateTime.parse(json['dateStarted']),
      completion: json['completion'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'goalId': goalId,
      'dateStarted': dateStarted.toIso8601String(),
      'completion': completion,
    };
  }
}
