import '../../entities/templates/post.dart';

class PostModel {
  final String userId;
  final DateTime date;
  final int fires;
  final String text;
  final String imageUrl;
  final String activeChallengeIds;
  final double dailyGoalsProgress;

  PostModel({
    required this.userId,
    required this.date,
    required this.fires,
    required this.text,
    required this.imageUrl,
    required this.activeChallengeIds,
    required this.dailyGoalsProgress,
  });

  factory PostModel.fromEntity(Post entity) {
    return PostModel(
      userId: entity.userId,
      date: entity.date,
      fires: entity.fires,
      text: entity.text,
      imageUrl: entity.imageUrl,
      activeChallengeIds: entity.activeChallengeIds,
      dailyGoalsProgress: entity.dailyGoalsProgress,
    );
  }

  Post toEntity() {
    return Post(
      userId: userId,
      date: date,
      fires: fires,
      text: text,
      imageUrl: imageUrl,
      activeChallengeIds: activeChallengeIds,
      dailyGoalsProgress: dailyGoalsProgress,
    );
  }

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['uid'],
      date: DateTime.parse(json['date']),
      fires: json['fires'],
      text: json['text'],
      imageUrl: json['imageUrl'],
      activeChallengeIds: json['activeChallengeIds'],
      dailyGoalsProgress: json['dailyGoalsProgress'].toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'uid': userId,
      'date': date.toIso8601String(),
      'fires': fires,
      'text': text,
      'imageUrl': imageUrl,
      'activeChallengeIds': activeChallengeIds,
      'dailyGoalsProgress': dailyGoalsProgress,
    };
  }
}
