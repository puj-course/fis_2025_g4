import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenge_detail/presentation/state_management/cubit/show_challenge_detail_cubit.dart';
import 'package:top_app/shared/loaders/centered_loader.dart';
import 'package:top_app/shared/loaders/shimmer_image.dart';

class CompetitorsGrid extends StatelessWidget {
  const CompetitorsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowChallengeDetailCubit, ShowChallengeDetailState>(
      builder: (context, state) {
        if (state is LoadingCompetitors) {
          return const CenteredLoader();
        }

        if (state is LoadedCompetitors) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Competitors',
                style: AppTextStyles.bold16.copyWith(color: AppColors.whitePrimary),
              ),
              const SizedBox(height: 16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: state.competitors.length,
                itemBuilder: (context, index) {
                  final competitor = state.competitors[index];
                  return Column(
                    children: [
                      ShimmerImage(
                        imageUrl: competitor.profilePictureUrl,
                        width: 60,
                        height: 60,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        competitor.userName,
                        style: AppTextStyles.regular14.copyWith(
                          color: AppColors.whitePrimary,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  );
                },
              ),
            ],
          );
        }

        if (state is ErrorLoadingCompetitors) {
          return Center(
            child: Text(
              state.errorMessage,
              style: AppTextStyles.regular14,
            ),
          );
        }

        return const SizedBox();
      },
    );
  }
}
