import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_icon.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';
import 'package:top_app/shared/widgets/chips/icon_text_chip.dart';
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
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.blackTertiary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    challenge.name,
                    style: AppTextStyles.bold16,
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: <Widget>[
                      IconNumberChip(
                        icon: Image.asset(
                          AppIcon.clock.assetPath,
                          width: 15.0,
                        ),
                        number: challenge.duration,
                        text: 'Days',
                      ),
                      const SizedBox(width: 8),
                      IconNumberChip(
                        icon: Image.asset(
                          AppIcon.diamond.assetPath,
                          width: 15.0,
                        ),
                        number: challenge.edgeReward,
                        text: 'Edge',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
