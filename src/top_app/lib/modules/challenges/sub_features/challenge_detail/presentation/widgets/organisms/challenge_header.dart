import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_icon.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/challenges/sub_features/challenge_detail/presentation/state_management/cubit/challenge_detail_cubit.dart';
import 'package:top_app/shared/widgets/chips/icon_text_chip.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';
import 'package:top_app/shared/entities/user_specific/user_challenge.dart';
import 'package:top_app/shared/global_state/user/domain/state_management/cubit/user_cubit.dart';
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
    final bool hasJoined = context
            .read<UserCubit>()
            .user
            ?.challenges
            .map((UserChallenge e) => e.challengeId)
            .contains(challenge.id) ??
        false;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: double.infinity,
          height: 250,
          child: ShimmerImage(
            imageUrl: challenge.thumbnailUrl,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            challenge.name,
            style: AppTextStyles.bold20,
          ),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: <Widget>[
              IconNumberChip(
                icon: Image.asset(
                  AppIcon.clock.assetPath,
                  width: 16,
                  height: 16,
                ),
                number: challenge.duration,
                text: 'Days',
              ),
              const SizedBox(width: 8),
              IconNumberChip(
                icon: Image.asset(
                  AppIcon.diamond.assetPath,
                  width: 16,
                  height: 16,
                ),
                number: challenge.edgeReward,
                text: 'Edge',
              ),
              const Spacer(),
              BlocBuilder<ChallengeDetailCubit, ChallengeDetailState>(
                builder: (BuildContext context, ChallengeDetailState state) {
                  return WhiteFilledButton(
                    text: 'Join Now',
                    onPressed: () {
                      context.read<ChallengeDetailCubit>().joinChallenge(challenge.id);
                    },
                    isLoading: state is JoiningChallenge,
                    isDone: hasJoined || state is JoinedChallenge,
                    doneInfoMessage: 'You have already joined this challenge',
                    doneIcon: const Icon(
                      Icons.check,
                      color: AppColors.blackPrimary,
                      size: 20,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    textStyle: AppTextStyles.bold14.copyWith(color: AppColors.blackPrimary),
                  );
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Created by ${challenge.authorName}',
            style: AppTextStyles.regular14.copyWith(color: AppColors.grayMidLight),
          ),
        ),
      ],
    );
  }
}
