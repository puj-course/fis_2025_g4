import 'package:flutter/material.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';
import 'package:top_app/modules/challenges/sub_features/challenges_list/presentation/widgets/molecules/challenge_card.dart';

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
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 16),
      itemBuilder: (BuildContext context, int index) {
        final Challenge challenge = challenges[index];
        return ChallengeCard(challenge: challenge);
      },
    );
  }
}
