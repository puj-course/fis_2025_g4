import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/home/presentation/widgets/molecules/todays_activity_card.dart';
import 'package:top_app/shared/entities/templates/activity.dart';

class TodaysActivitiesSection extends StatelessWidget {
  const TodaysActivitiesSection({
    super.key,
    required this.activities,
    required this.onActivityTap,
  });

  final List<Activity> activities;
  final Function(Activity) onActivityTap;

  @override
  Widget build(BuildContext context) {
    if (activities.isEmpty) {
      return Center(
        child: Text(
          'No activities for today',
          style: AppTextStyles.regular14,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Today Activities',
          style: AppTextStyles.bold16,
        ),
        const SizedBox(height: 16),
        ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: activities.length,
          separatorBuilder: (context, index) => const SizedBox(height: 12),
          itemBuilder: (context, index) {
            final activity = activities[index];
            return TodaysActivityCard(
              activity: activity,
              onTap: () => onActivityTap(activity),
            );
          },
        ),
      ],
    );
  }
}
