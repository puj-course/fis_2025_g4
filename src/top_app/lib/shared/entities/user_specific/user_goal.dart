import 'package:equatable/equatable.dart';

class UserGoal extends Equatable {
  final String userId;
  final String goalId;
  final DateTime dateStarted;
  final double completion;

  const UserGoal({
    required this.userId,
    required this.goalId,
    required this.dateStarted,
    required this.completion,
  });

  UserGoal copyWith({
    String? userId,
    String? goalId,
    DateTime? dateStarted,
    double? completion,
  }) {
    return UserGoal(
      userId: userId ?? this.userId,
      goalId: goalId ?? this.goalId,
      dateStarted: dateStarted ?? this.dateStarted,
      completion: completion ?? this.completion,
    );
  }

  @override
  List<Object?> get props => [userId, goalId, dateStarted, completion];
}
