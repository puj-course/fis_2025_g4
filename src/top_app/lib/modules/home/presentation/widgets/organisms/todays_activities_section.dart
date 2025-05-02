import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/home/presentation/widgets/molecules/todays_activity_card.dart';
import 'package:top_app/shared/entities/templates/activity.dart';

class TodaysActivitiesSection extends StatelessWidget {
  const TodaysActivitiesSection({
    super.key,
    required this.activities,
  });

  final List<Activity> activities;
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

    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: activities.length,
      padding: EdgeInsets.zero,
      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 12),
      itemBuilder: (BuildContext context, int index) {
        return TodaysActivityCard(activity: activities[index]);
      },
    );
  }
}
