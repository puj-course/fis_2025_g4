import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/home/presentation/state_management/activities_cubit/activities_cubit.dart';
import 'package:top_app/shared/entities/templates/activity.dart';
import 'package:top_app/shared/widgets/cards/activity_card.dart';

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
          'No activities for today, join a new challenge! 🏆',
          style: AppTextStyles.regular14,
          textAlign: TextAlign.center,
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
        final Activity activity = activities[index];
        final bool isCompleted = context.read<ActivitiesCubit>().isActivityCompleted(activity.id);
        return ActivityCard(
          name: activity.name,
          icon: activity.icon,
          onTap: isCompleted
              ? null
              : () => AutoRouter.of(context).push(SubmitActivityProofRoute(activity: activity)),
          streakEdge: activity.streakEdge,
          trailing: isCompleted
              ? Icon(
                  Icons.check,
                  size: 22,
                )
              : Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                ),
        );
      },
    );
  }
}
