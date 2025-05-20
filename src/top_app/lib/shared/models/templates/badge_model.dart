import '../../entities/templates/badge.dart';

class BadgeModel {
  final String iconUrl;
  final String name;
  final String challengeId;

  BadgeModel({
    required this.iconUrl,
    required this.name,
    required this.challengeId,
  });

  factory BadgeModel.fromEntity(Badge entity) {
    return BadgeModel(
      iconUrl: entity.iconUrl,
      name: entity.name,
      challengeId: entity.challengeId,
    );
  }

  Badge toEntity() {
    return Badge(
      iconUrl: iconUrl,
      name: name,
      challengeId: challengeId,
    );
  }

  factory BadgeModel.fromJson(Map<String, dynamic> json) {
    return BadgeModel(
      iconUrl: json['iconUrl'],
      name: json['name'],
      challengeId: json['challengeId'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'iconUrl': iconUrl,
      'name': name,
      'challengeId': challengeId,
    };
  }
}
