import 'package:equatable/equatable.dart';
import 'activity.dart';

class Challenge extends Equatable {
  final String id;
  final String name;
  final String description;
  final String thumbnailUrl;
  final String iconCode;
  final int duration;
  final int edgeReward;
  final String authorName;
  final String authorId;
  final List<Activity> activities;

  const Challenge({
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

  Challenge copyWith({
    String? id,
    String? name,
    String? description,
    String? thumbnailUrl,
    String? iconCode,
    int? duration,
    int? edgeReward,
    String? authorName,
    String? authorId,
    List<Activity>? activities,
  }) {
    return Challenge(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      iconCode: iconCode ?? this.iconCode,
      duration: duration ?? this.duration,
      edgeReward: edgeReward ?? this.edgeReward,
      authorName: authorName ?? this.authorName,
      authorId: authorId ?? this.authorId,
      activities: activities ?? this.activities,
    );
  }

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        thumbnailUrl,
        iconCode,
        duration,
        edgeReward,
        authorName,
        authorId,
        activities,
      ];
}
