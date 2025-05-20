import 'package:equatable/equatable.dart';
import 'package:top_app/core/theme/app_icon.dart';
import 'activity.dart';

class Challenge extends Equatable {
  final String id;
  final String name;
  final String description;
  final String thumbnailUrl;
  final AppIcon icon;
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
    required this.icon,
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
    AppIcon? icon,
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
      icon: icon ?? this.icon,
      duration: duration ?? this.duration,
      edgeReward: edgeReward ?? this.edgeReward,
      authorName: authorName ?? this.authorName,
      authorId: authorId ?? this.authorId,
      activities: activities ?? this.activities,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        id,
        name,
        description,
        thumbnailUrl,
        icon,
        duration,
        edgeReward,
        authorName,
        authorId,
        activities,
      ];
}
