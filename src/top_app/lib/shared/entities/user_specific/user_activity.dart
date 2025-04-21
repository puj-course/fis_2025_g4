import 'package:equatable/equatable.dart';
import 'user_proof.dart';

class UserActivity extends Equatable {
  final String activityName;
  final int currentStreak;
  final double completion;
  final List<UserProof>? proofs;

  const UserActivity({
    required this.activityName,
    required this.currentStreak,
    required this.completion,
    required this.proofs,
  });

  UserActivity copyWith({
    String? activityName,
    int? currentStreak,
    double? completion,
    List<UserProof>? proofs,
  }) {
    return UserActivity(
      activityName: activityName ?? this.activityName,
      currentStreak: currentStreak ?? this.currentStreak,
      completion: completion ?? this.completion,
      proofs: proofs ?? this.proofs,
    );
  }

  @override
  List<Object?> get props => [activityName, currentStreak, completion, proofs];
}
