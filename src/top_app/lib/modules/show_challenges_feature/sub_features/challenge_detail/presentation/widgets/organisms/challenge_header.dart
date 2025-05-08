import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_icon.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenges_list/presentation/widgets/atoms/challenge_chip.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';
import 'package:top_app/shared/loaders/shimmer_image.dart';
import 'package:top_app/shared/widgets/buttons/white_filled_button.dart';

class ChallengeHeader extends StatelessWidget {
  const ChallengeHeader({
    super.key,
    required this.challenge,
  });

  final Challenge challenge;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 220,
          child: ShimmerImage(
            imageUrl: challenge.thumbnailUrl,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        Text(
          challenge.name,
          style: AppTextStyles.bold18,
        ),
        const SizedBox(height: 8),
        Row(
          children: <Widget>[
            ChallengeChip(
              icon: Image.asset(
                AppIcon.clock.assetPath,
                width: 16,
                height: 16,
              ),
              text: '${challenge.duration} days',
            ),
            const SizedBox(width: 8),
            ChallengeChip(
              icon: Image.asset(
                AppIcon.diamond.assetPath,
                width: 16,
                height: 16,
              ),
              text: '+${challenge.edgeReward} Edge',
            ),
            const Spacer(),
            WhiteFilledButton(
              text: 'Join Now',
              onPressed: () {},
              isLoading: false,
              isDone: false,
              doneIcon: const Icon(
                Icons.check,
                color: AppColors.blackPrimary,
                size: 20,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              textStyle: AppTextStyles.regular14.copyWith(color: AppColors.blackPrimary),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          'Created by ${challenge.authorName}',
          style: AppTextStyles.regular14.copyWith(color: AppColors.grayMidLight),
        ),
      ],
    );
  }
}
