import '../../entities/templates/challenge.dart';
import 'activity_model.dart';

class ChallengeModel {
  final String id;
  final String name;
  final String description;
  final String thumbnailUrl;
  final String iconCode;
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
    required this.iconCode,
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
      iconCode: entity.iconCode,
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
      iconCode: iconCode,
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
      iconCode: json['iconCode'],
      duration: json['duration'],
      edgeReward: json['edgeReward'],
      authorName: json['authorName'],
      authorId: json['authorId'],
      activities: (json['activities'] as List).map((a) => ActivityModel.fromJson(a)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'thumbnailUrl': thumbnailUrl,
      'iconCode': iconCode,
      'duration': duration,
      'edgeReward': edgeReward,
      'authorName': authorName,
      'authorId': authorId,
      'activities': activities.map((a) => a.toJson()).toList(),
    };
  }
}
