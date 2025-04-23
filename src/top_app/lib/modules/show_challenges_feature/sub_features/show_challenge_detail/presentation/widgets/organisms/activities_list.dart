import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenge_detail/presentation/widgets/molecules/activity_card.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';

class ActivitiesList extends StatelessWidget {
  const ActivitiesList({
    super.key,
    required this.challenge,
  });

  final Challenge challenge;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Activities',
          style: AppTextStyles.bold16,
        ),
        const SizedBox(height: 10),
        ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: challenge.activities.length,
          separatorBuilder: (context, index) => const SizedBox(height: 5),
          itemBuilder: (context, index) {
            final activity = challenge.activities[index];
            return ActivityCard(
              name: activity.name,
              streakEdge: activity.streakEdge,
              icon: activity.icon,
            );
          },
        ),
      ],
    );
  }
}
