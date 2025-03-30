import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_icon.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenges_list/presentation/widgets/atoms/challenge_chip.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    super.key,
    required this.name,
    required this.streakEdge,
    required this.onTap,
  });

  final String name;
  final int streakEdge;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
                AppIcon.target.assetPath,
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
                    name,
                    style: AppTextStyles.bold16,
                  ),
                  const SizedBox(height: 8),
                  ChallengeChip(
                    icon: Image.asset(
                      AppIcon.diamond.assetPath,
                      width: 16,
                      height: 16,
                    ),
                    text: '+$streakEdge Edge',
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.arrow_forward_ios,
              color: AppColors.whitePrimary,
              size: 16,
            ),
          ],
        ),
      ),
    );
  }
}
