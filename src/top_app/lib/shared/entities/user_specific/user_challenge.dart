import 'package:equatable/equatable.dart';
import 'user_activity.dart';

class UserChallenge extends Equatable {
  final String userId;
  final String challengeId;
  final DateTime dateStarted;
  final int currentStreak;
  final int bestStreak;
  final double completion;
  final List<UserActivity> activities;

  const UserChallenge({
    required this.userId,
    required this.challengeId,
    required this.dateStarted,
    required this.currentStreak,
    required this.bestStreak,
    required this.completion,
    required this.activities,
  });

  UserChallenge copyWith({
    String? userId,
    String? challengeId,
    DateTime? dateStarted,
    int? currentStreak,
    int? bestStreak,
    double? completion,
    List<UserActivity>? activities,
  }) {
    return UserChallenge(
      userId: userId ?? this.userId,
      challengeId: challengeId ?? this.challengeId,
      dateStarted: dateStarted ?? this.dateStarted,
      currentStreak: currentStreak ?? this.currentStreak,
      bestStreak: bestStreak ?? this.bestStreak,
      completion: completion ?? this.completion,
      activities: activities ?? this.activities,
    );
  }

  @override
  List<Object?> get props => [
        userId,
        challengeId,
        dateStarted,
        currentStreak,
        bestStreak,
        completion,
        activities,
      ];
}
