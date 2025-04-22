import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_icon.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenges_list/presentation/widgets/atoms/challenge_chip.dart';
import 'package:top_app/shared/entities/templates/activity.dart';

class TodaysActivityCard extends StatelessWidget {
  const TodaysActivityCard({
    super.key,
    required this.activity,
    required this.onTap,
  });

  final Activity activity;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
                width: 24,
                height: 24,
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
