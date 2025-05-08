import 'package:top_app/core/theme/app_icon.dart';

import '../../entities/templates/challenge.dart';
import 'activity_model.dart';

class ChallengeModel {
  final String id;
  final String name;
  final String description;
  final String thumbnailUrl;
  final AppIcon icon;
  final int duration;
  final int edgeReward;
  final String authorName;
  final String authorId;
  final List<ActivityModel> activities;

  ChallengeModel({
    required this.id,
    required this.name,
    required this.description,
    required this.thumbnailUrl,
    required this.icon,
    required this.duration,
    required this.edgeReward,
    required this.authorName,
    required this.authorId,
    required this.activities,
  });

  factory ChallengeModel.fromEntity(Challenge entity) {
    return ChallengeModel(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      thumbnailUrl: entity.thumbnailUrl,
      icon: entity.icon,
      duration: entity.duration,
      edgeReward: entity.edgeReward,
      authorName: entity.authorName,
      authorId: entity.authorId,
      activities: entity.activities.map((a) => ActivityModel.fromEntity(a)).toList(),
    );
  }

  Challenge toEntity() {
    return Challenge(
      id: id,
      name: name,
      description: description,
      thumbnailUrl: thumbnailUrl,
      icon: icon,
      duration: duration,
      edgeReward: edgeReward,
      authorName: authorName,
      authorId: authorId,
      activities: activities.map((a) => a.toEntity()).toList(),
    );
  }

  factory ChallengeModel.fromJson(Map<String, dynamic> json) {
    return ChallengeModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      thumbnailUrl: json['thumbnailUrl'],
      icon: AppIcon.fromCode(json['iconCode']),
      duration: json['duration'] ?? 0,
      edgeReward: json['edgeReward'] ?? 0,
      authorName: json['authorName'],
      authorId: json['authorId'],
      activities:
          (json['activities'] as List).map((a) => ActivityModel.fromJson(a, json['id'])).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'thumbnailUrl': thumbnailUrl,
      'iconCode': icon.iconCode,
      'duration': duration,
      'edgeReward': edgeReward,
      'authorName': authorName,
      'authorId': authorId,
      'activities': activities.map((a) => a.toJson()).toList(),
    };
  }
}
