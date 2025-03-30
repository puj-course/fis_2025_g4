import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_icon.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/shared/widgets/buttons/white_filled_button.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenges_list/presentation/widgets/atoms/challenge_chip.dart';
import 'package:top_app/shared/loaders/shimmer_image.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({
    super.key,
    required this.name,
    required this.thumbnailUrl,
    required this.duration,
    required this.edgeReward,
    required this.onJoinPressed,
  });

  final String name;
  final String thumbnailUrl;
  final int duration;
  final int edgeReward;
  final VoidCallback onJoinPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.blackSecondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ShimmerImage(
            imageUrl: thumbnailUrl,
            width: 80,
            height: 80,
            borderRadius: BorderRadius.circular(8),
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
                Row(
                  children: [
                    ChallengeChip(
                      icon: const Icon(
                        Icons.access_time,
                        size: 16,
                        color: AppColors.whitePrimary,
                      ),
                      text: '$duration days',
                    ),
                    const SizedBox(width: 8),
                    ChallengeChip(
                      icon: Image.asset(
                        AppIcon.diamond.assetPath,
                        width: 15.0,
                      ),
                      text: '+$edgeReward Edge',
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  child: WhiteFilledButton(
                    text: 'Join Now',
                    onPressed: onJoinPressed,
                    padding: EdgeInsets.zero,
                    textStyle: AppTextStyles.regular14.copyWith(color: AppColors.blackPrimary),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
