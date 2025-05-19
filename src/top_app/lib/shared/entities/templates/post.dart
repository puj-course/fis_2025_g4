import 'package:equatable/equatable.dart';

class Post extends Equatable {
  final String userId;
  final DateTime date;
  final int fires;
  final String text;
  final String imageUrl;
  final String activeChallengeIds;
  final double dailyGoalsProgress;

  const Post({
    required this.userId,
    required this.date,
    required this.fires,
    required this.text,
    required this.imageUrl,
    required this.activeChallengeIds,
    required this.dailyGoalsProgress,
  });

  Post copyWith({
    String? userId,
    DateTime? date,
    int? fires,
    String? text,
    String? imageUrl,
    String? activeChallengeIds,
    double? dailyGoalsProgress,
  }) {
    return Post(
      userId: userId ?? this.userId,
      date: date ?? this.date,
      fires: fires ?? this.fires,
      text: text ?? this.text,
      imageUrl: imageUrl ?? this.imageUrl,
      activeChallengeIds: activeChallengeIds ?? this.activeChallengeIds,
      dailyGoalsProgress: dailyGoalsProgress ?? this.dailyGoalsProgress,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        userId,
        date,
        fires,
        text,
        imageUrl,
        activeChallengeIds,
        dailyGoalsProgress,
      ];
}
