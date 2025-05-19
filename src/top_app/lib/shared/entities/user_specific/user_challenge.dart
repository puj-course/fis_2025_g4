import 'package:equatable/equatable.dart';
import 'user_activity_progress.dart';

class UserChallenge extends Equatable {
  final String challengeId;
  final DateTime dateStarted;
  final int currentStreak;
  final int bestStreak;
  final double completion;
  final List<UserActivityProgress> activities;

  const UserChallenge({
    required this.challengeId,
    required this.dateStarted,
    required this.currentStreak,
    required this.bestStreak,
    required this.completion,
    required this.activities,
  });

  UserChallenge copyWith({
    String? challengeId,
    DateTime? dateStarted,
    int? currentStreak,
    int? bestStreak,
    double? completion,
    List<UserActivityProgress>? activities,
  }) {
    return UserChallenge(
      challengeId: challengeId ?? this.challengeId,
      dateStarted: dateStarted ?? this.dateStarted,
      currentStreak: currentStreak ?? this.currentStreak,
      bestStreak: bestStreak ?? this.bestStreak,
      completion: completion ?? this.completion,
      activities: activities ?? this.activities,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        challengeId,
        dateStarted,
        currentStreak,
        bestStreak,
        completion,
        activities,
      ];
}
