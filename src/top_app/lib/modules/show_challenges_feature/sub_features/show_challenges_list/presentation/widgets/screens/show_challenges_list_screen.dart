import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/di/injector.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenges_list/presentation/state_management/cubit/challenges_cubit.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenges_list/presentation/widgets/organisms/challenges_list.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenges_list/presentation/widgets/organisms/empty_challenges_content.dart';
import 'package:top_app/shared/errors/error_message.dart';
import 'package:top_app/shared/loaders/centered_loader.dart';

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
      appBar: AppBar(
        backgroundColor: AppColors.blackPrimary,
        title: Text(
          'Browse Challenges',
          style: AppTextStyles.bold16,
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list, color: AppColors.whitePrimary),
            onPressed: () {
              // TODO: Implement filtering
            },
          ),
        ],
      ),
      body: BlocBuilder<ChallengesCubit, ChallengesState>(
        builder: (context, ChallengesState state) {
          if (state is LoadingChallenges) {
            return const CenteredLoader();
          }

          if (state is LoadedChallenges) {
            if (state.challenges.isEmpty) {
              return const EmptyChallengesContent();
            }

            return ChallengesList(
              challenges: state.challenges,
            );
          }

          if (state is ErrorLoadingChallenges) {
            return ErrorMessage(
              message: state.errorMessage,
              onTryAgain: () {
                context.read<ChallengesCubit>().getChallenges();
              },
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
