import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/challenges/sub_features/challenge_detail/domain/entities/competitor_info.dart';
import 'package:top_app/modules/challenges/sub_features/challenge_detail/presentation/state_management/cubit/challenge_detail_cubit.dart';
import 'package:top_app/modules/challenges/sub_features/challenge_detail/presentation/widgets/molecules/competitors_grid_shimmer.dart';
import 'package:top_app/shared/loaders/shimmer_image.dart';

class CompetitorsGrid extends StatelessWidget {
  const CompetitorsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChallengeDetailCubit, ChallengeDetailState>(
      builder: (BuildContext context, ChallengeDetailState state) {
        if (state is LoadingCompetitors) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Competitors', style: AppTextStyles.bold18),
              const SizedBox(height: 16),
              const CompetitorsGridShimmer(),
            ],
          );
        }

        if (state is LoadedCompetitors) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Competitors', style: AppTextStyles.bold18),
              const SizedBox(height: 16),
              GridView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  mainAxisExtent: 110,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: state.competitors.length,
                itemBuilder: (BuildContext context, int index) {
                  final CompetitorInfo competitor = state.competitors[index];
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ShimmerImage(
                        imageUrl: competitor.profilePictureUrl,
                        width: 60,
                        height: 60,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        competitor.userName,
                        style: AppTextStyles.regular12.copyWith(
                          color: AppColors.whitePrimary,
                        ),
                        textAlign: TextAlign.center,
                        maxLines: 2,
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
