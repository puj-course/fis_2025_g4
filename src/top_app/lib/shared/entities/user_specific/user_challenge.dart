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

  @override
  List<Object?> get props => [
        challengeId,
        dateStarted,
        currentStreak,
        bestStreak,
        completion,
        activities,
      ];
}
