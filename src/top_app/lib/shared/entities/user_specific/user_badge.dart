import 'package:equatable/equatable.dart';

class UserBadge extends Equatable {
  final String userId;
  final String badgeId;
  final DateTime earnedDate;

  const UserBadge({
    required this.userId,
    required this.badgeId,
    required this.earnedDate,
  });

  UserBadge copyWith({
    String? userId,
    String? badgeId,
    DateTime? earnedDate,
  }) {
    return UserBadge(
      userId: userId ?? this.userId,
      badgeId: badgeId ?? this.badgeId,
      earnedDate: earnedDate ?? this.earnedDate,
    );
  }

  @override
  List<Object?> get props => <Object?>[userId, badgeId, earnedDate];
}
