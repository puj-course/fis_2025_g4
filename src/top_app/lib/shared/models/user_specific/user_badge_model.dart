import '../../entities/user_specific/user_badge.dart';

class UserBadgeModel {
  final String userId;
  final String badgeId;
  final DateTime earnedDate;

  UserBadgeModel({
    required this.userId,
    required this.badgeId,
    required this.earnedDate,
  });

  factory UserBadgeModel.fromEntity(UserBadge entity) {
    return UserBadgeModel(
      userId: entity.userId,
      badgeId: entity.badgeId,
      earnedDate: entity.earnedDate,
    );
  }

  UserBadge toEntity() {
    return UserBadge(
      userId: userId,
      badgeId: badgeId,
      earnedDate: earnedDate,
    );
  }

  factory UserBadgeModel.fromJson(Map<String, dynamic> json) {
    return UserBadgeModel(
      userId: json['userId'],
      badgeId: json['badgeId'],
      earnedDate: DateTime.parse(json['earnedDate']),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userId': userId,
      'badgeId': badgeId,
      'earnedDate': earnedDate.toIso8601String(),
    };
  }
}
