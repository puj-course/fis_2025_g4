import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_icon.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenges_list/presentation/widgets/atoms/challenge_chip.dart';
import 'package:top_app/shared/entities/templates/activity.dart';

class TodaysActivityCard extends StatelessWidget {
  const TodaysActivityCard({
    super.key,
    required this.activity,
  });

  final Activity activity;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AutoRouter.of(context).push(SubmitActivityProofRoute(activity: activity)),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.blackSecondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
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
                children: [
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
            Icon(
              Icons.arrow_forward_ios,
              color: AppColors.whitePrimary,
              size: 16,
            )
          ],
        ),
      ),
    );
  }
}
