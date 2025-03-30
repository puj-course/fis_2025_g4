import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/di/injector.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenges_list/presentation/state_management/cubit/challenges_cubit.dart';

@RoutePage()
class ShowChallengesListScreen extends StatelessWidget {
  const ShowChallengesListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ChallengesCubit>()..getChallenges(),
      child: const ShowChallengesListScreenBody(),
    );
  }
}

class ShowChallengesListScreenBody extends StatelessWidget {
  const ShowChallengesListScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackPrimary,
      body: BlocBuilder<ChallengesCubit, ChallengesState>(
        builder: (context, ChallengesState state) {
          if (state is LoadingChallenges) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is LoadedChallenges) {
            return ListView.builder(
              itemCount: state.challenges.length,
              itemBuilder: (context, index) => Text(
                state.challenges[index].name,
                style: AppTextStyles.regular14,
              ),
            );
          }

          if (state is ErrorLoadingChallenges) {
            return Center(
              child: Text(
                'Error loading challenges: ${state.errorMessage}',
                style: AppTextStyles.regular14,
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
