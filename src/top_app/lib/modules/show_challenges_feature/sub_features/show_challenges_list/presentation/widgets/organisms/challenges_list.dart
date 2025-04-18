import 'package:flutter/material.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenges_list/presentation/widgets/molecules/challenge_card.dart';

class ChallengesList extends StatelessWidget {
  const ChallengesList({
    super.key,
    required this.challenges,
  });

  final List<Challenge> challenges;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: challenges.length,
      separatorBuilder: (context, index) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final challenge = challenges[index];
        return ChallengeCard(
          name: challenge.name,
          thumbnailUrl: challenge.thumbnailUrl,
          duration: challenge.duration,
          edgeReward: challenge.edgeReward,
          onJoinPressed: () {},
        );
      },
    );
  }
}
