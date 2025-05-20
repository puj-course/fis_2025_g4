import 'package:equatable/equatable.dart';
import 'user_proof.dart';

class UserActivityProgress extends Equatable {
  final String activityId;
  final int currentStreak;
  final Map<DateTime, UserProof> dailyProofs;

  const UserActivityProgress({
    required this.activityId,
    required this.currentStreak,
    required this.dailyProofs,
  });

  UserActivityProgress copyWith({
    String? activityId,
    int? currentStreak,
    double? completion,
    Map<DateTime, UserProof>? dailyProofs,
  }) {
    return UserActivityProgress(
      activityId: activityId ?? this.activityId,
      currentStreak: currentStreak ?? this.currentStreak,
      dailyProofs: dailyProofs ?? this.dailyProofs,
    );
  }

  @override
  List<Object?> get props => <Object?>[activityId, currentStreak, dailyProofs];
}
