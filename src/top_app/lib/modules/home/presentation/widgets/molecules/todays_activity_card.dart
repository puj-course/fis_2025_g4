import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_icon.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/home/presentation/state_management/activities_cubit/activities_cubit.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenges_list/presentation/widgets/atoms/challenge_chip.dart';
import 'package:top_app/shared/entities/templates/activity.dart';
import 'package:top_app/shared/global_state/user/domain/state_management/cubit/user_cubit.dart';

class TodaysActivityCard extends StatelessWidget {
  const TodaysActivityCard({
    super.key,
    required this.activity,
  });

  final Activity activity;
  @override
  Widget build(BuildContext context) {
    final bool isCompleted = context.read<ActivitiesCubit>().isActivityCompleted(activity.id);
    return GestureDetector(
      onTap: isCompleted
          ? null
          : () async {
              final Object? wasCompleted =
                  await AutoRouter.of(context).push(SubmitActivityProofRoute(activity: activity));
              if (wasCompleted != null && wasCompleted == true) {
                context.read<UserCubit>().getUser();
              }
            },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.blackSecondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.blackTertiary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                activity.icon.assetPath,
                width: 32,
                height: 32,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    activity.name,
                    style: AppTextStyles.bold14,
                  ),
                  const SizedBox(height: 8),
                  ChallengeChip(
                    icon: Image.asset(
                      AppIcon.diamond.assetPath,
                      width: 16,
                      height: 16,
                    ),
                    text: '+${activity.streakEdge} Edge',
                  ),
                ],
              ),
            ),
            BlocBuilder<ActivitiesCubit, ActivitiesState>(
              builder: (BuildContext context, ActivitiesState state) {
                return isCompleted
                    ? Image.asset(
                        AppIcon.checkCompleted.assetPath,
                        width: 20,
                        height: 20,
                      )
                    : Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors.whitePrimary,
                        size: 20,
                      );
              },
            ),
          ],
        ),
      ),
    );
  }
}
