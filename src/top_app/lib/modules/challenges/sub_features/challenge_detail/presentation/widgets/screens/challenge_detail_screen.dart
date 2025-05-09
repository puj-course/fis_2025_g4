import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/di/injector.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/challenges/sub_features/challenge_detail/presentation/state_management/cubit/challenge_detail_cubit.dart';
import 'package:top_app/modules/challenges/sub_features/challenge_detail/presentation/widgets/atoms/custom_divider.dart';
import 'package:top_app/modules/challenges/sub_features/challenge_detail/presentation/widgets/molecules/challenge_description.dart';
import 'package:top_app/modules/challenges/sub_features/challenge_detail/presentation/widgets/organisms/activities_list.dart';
import 'package:top_app/modules/challenges/sub_features/challenge_detail/presentation/widgets/organisms/challenge_header.dart';
import 'package:top_app/modules/challenges/sub_features/challenge_detail/presentation/widgets/organisms/competitors_grid.dart';
import 'package:top_app/modules/challenges/sub_features/challenge_detail/presentation/widgets/organisms/proofs_list.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';
import 'package:top_app/shared/widgets/snackbars/custom_snackbar.dart';

@RoutePage()
class ChallengeDetailScreen extends StatelessWidget {
  const ChallengeDetailScreen({
    super.key,
    required this.challenge,
  });

  final Challenge challenge;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChallengeDetailCubit>(
      create: (BuildContext context) =>
          getIt<ChallengeDetailCubit>()..getChallengeCompetitors(challenge.id),
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
    return BlocListener<ChallengeDetailCubit, ChallengeDetailState>(
      listener: (BuildContext context, ChallengeDetailState state) {
        if (state is ErrorJoiningChallenge) {
          CustomSnackBar.error(context, state.errorMessage);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.blackPrimary,
        appBar: AppBar(
          backgroundColor: AppColors.blackPrimary,
          foregroundColor: AppColors.whitePrimary,
          title: Text(
            challenge.name,
            style: AppTextStyles.bold18.copyWith(color: AppColors.whitePrimary),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.share),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              ChallengeHeader(challenge: challenge),
              const CustomDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ChallengeDescription(description: challenge.description),
              ),
              const CustomDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ActivitiesList(challenge: challenge),
              ),
              const CustomDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ProofsList(challenge: challenge),
              ),
              const CustomDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const CompetitorsGrid(),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }
}
