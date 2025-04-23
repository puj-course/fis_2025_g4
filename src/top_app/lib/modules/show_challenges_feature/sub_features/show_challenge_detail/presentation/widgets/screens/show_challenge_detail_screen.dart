import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/di/injector.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenge_detail/presentation/state_management/cubit/show_challenge_detail_cubit.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenge_detail/presentation/widgets/atoms/custom_divider.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenge_detail/presentation/widgets/molecules/challenge_description.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenge_detail/presentation/widgets/organisms/activities_list.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenge_detail/presentation/widgets/organisms/challenge_header.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenge_detail/presentation/widgets/organisms/competitors_grid.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenge_detail/presentation/widgets/organisms/proofs_list.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';

@RoutePage()
class ShowChallengeDetailScreen extends StatelessWidget {
  const ShowChallengeDetailScreen({
    super.key,
    required this.challenge,
  });

  final Challenge challenge;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ShowChallengeDetailCubit>()..getChallengeCompetitors(challenge.id),
      child: ShowChallengeDetailBody(challenge: challenge),
    );
  }
}

class ShowChallengeDetailBody extends StatelessWidget {
  final Challenge challenge;

  const ShowChallengeDetailBody({
    super.key,
    required this.challenge,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackPrimary,
      appBar: AppBar(
        backgroundColor: AppColors.blackPrimary,
        foregroundColor: AppColors.whitePrimary,
        title: Text(
          challenge.name,
          style: AppTextStyles.bold18.copyWith(color: AppColors.whitePrimary),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.share),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ChallengeHeader(challenge: challenge),
              const CustomDivider(),
              ChallengeDescription(description: challenge.description),
              const CustomDivider(),
              ActivitiesList(challenge: challenge),
              const CustomDivider(),
              ProofsList(challenge: challenge),
              const CustomDivider(),
              const CompetitorsGrid(),
            ],
          ),
        ),
      ),
    );
  }
}
