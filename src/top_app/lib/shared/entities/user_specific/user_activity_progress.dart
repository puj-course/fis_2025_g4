import 'package:equatable/equatable.dart';
import 'user_proof.dart';

class UserActivityProgress extends Equatable {
  final String activityName;
  final int currentStreak;
  final double completion;
  final List<UserProof>? proofs;

  const UserActivityProgress({
    required this.activityName,
    required this.currentStreak,
    required this.completion,
    required this.proofs,
  });

  UserActivityProgress copyWith({
    String? activityName,
    int? currentStreak,
    double? completion,
    List<UserProof>? proofs,
  }) {
    return UserActivityProgress(
      activityName: activityName ?? this.activityName,
      currentStreak: currentStreak ?? this.currentStreak,
      completion: completion ?? this.completion,
      proofs: proofs ?? this.proofs,
    );
  }

  @override
  List<Object?> get props => <Object?>[activityName, currentStreak, completion, proofs];
}
