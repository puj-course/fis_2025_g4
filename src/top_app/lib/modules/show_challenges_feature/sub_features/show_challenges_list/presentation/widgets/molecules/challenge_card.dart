import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_icon.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenges_list/presentation/widgets/atoms/challenge_chip.dart';
import 'package:top_app/shared/loaders/shimmer_image.dart';

class ChallengeCard extends StatelessWidget {
  const ChallengeCard({
    super.key,
    required this.challenge,
  });

  final Challenge challenge;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(ChallengeDetailRoute(challenge: challenge));
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppColors.blackSecondary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            ShimmerImage(
              imageUrl: challenge.thumbnailUrl,
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
                    challenge.name,
                    style: AppTextStyles.bold16,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      ChallengeChip(
                        icon: Image.asset(
                          AppIcon.clock.assetPath,
                          width: 15.0,
                        ),
                        text: '${challenge.duration} days',
                      ),
                      const SizedBox(width: 8),
                      ChallengeChip(
                        icon: Image.asset(
                          AppIcon.diamond.assetPath,
                          width: 15.0,
                        ),
                        text: '+${challenge.edgeReward} Edge',
                      ),
                    ],
                  ),
                  // const SizedBox(height: 12),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: WhiteFilledButton(
                  //     text: 'See details',
                  //     onPressed: () {
                  //       AutoRouter.of(context).push(ShowChallengeDetailRoute(challenge: challenge));
                  //     },
                  //     borderRadius: 8,
                  //     padding: const EdgeInsets.symmetric(vertical: 5),
                  //     textStyle: AppTextStyles.regular14.copyWith(color: AppColors.blackPrimary),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
