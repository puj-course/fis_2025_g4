import 'package:top_app/core/theme/app_icon.dart';
import 'package:top_app/shared/entities/templates/activity.dart';

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
  final Map<String, ActivityModel> activities;

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
      activities: Map.fromEntries(
        entity.activities.map((Activity a) => MapEntry(a.id, ActivityModel.fromEntity(a))),
      ),
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
      activities: activities.values.map((ActivityModel a) => a.toEntity()).toList(),
    );
  }

  factory ChallengeModel.fromJson(Map<String, dynamic> json) {
    final Map<String, dynamic> activitiesMap = json['activities'] as Map<String, dynamic>;
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
      activities: Map<String, ActivityModel>.fromEntries(
        activitiesMap.entries.map(
          (MapEntry<String, dynamic> e) =>
              MapEntry<String, ActivityModel>(e.key, ActivityModel.fromJson(e.value, json['id'])),
        ),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'thumbnailUrl': thumbnailUrl,
      'iconCode': icon.iconCode,
      'duration': duration,
      'edgeReward': edgeReward,
      'authorName': authorName,
      'authorId': authorId,
      'activities': Map.fromEntries(
        activities.entries
            .map((MapEntry<String, ActivityModel> e) => MapEntry(e.key, e.value.toJson())),
      ),
    };
  }
}
