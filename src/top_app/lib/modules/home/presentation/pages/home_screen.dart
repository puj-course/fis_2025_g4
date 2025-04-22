import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/modules/home/presentation/cubit/home_cubit.dart';
import 'package:top_app/modules/home/presentation/widgets/organisms/home_app_bar.dart';
import 'package:top_app/modules/home/presentation/widgets/organisms/todays_activities_section.dart';
import 'package:top_app/modules/home/presentation/widgets/organisms/todays_goals_section.dart';
import 'package:top_app/shared/global_state/user/domain/state_management/cubit/user_cubit.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: GetIt.I<UserCubit>()..fetchUser(),
        ),
        BlocProvider.value(
          value: GetIt.I<HomeCubit>(),
        ),
      ],
      child: const HomeScreenContent(),
    );
  }
}

class HomeScreenContent extends StatelessWidget {
  const HomeScreenContent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is Unauthenticated) {
          AutoRouter.of(context).replace(const WelcomeRoute());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.blackPrimary,
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is Loaded) {
              return CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: true,
                    pinned: true,
                    expandedHeight: 0,
                    flexibleSpace: HomeAppBar(user: state.user),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        Text(
                          "Today's Activities",
                          style: AppTextStyles.bold18,
                        ),
                        const SizedBox(height: 16),
                        TodaysActivitiesSection(
                          activities: state.activities ?? [],
                          onActivityTap: (activity) {
                            print('Activity tapped: ${activity.name}');
                          },
                        ),
                        const SizedBox(height: 24),
                        Text(
                          "Today's Goals",
                          style: AppTextStyles.bold18,
                        ),
                        const SizedBox(height: 16),
                        TodaysGoalsSection(
                          goals: state.goals ?? [],
                          onGoalComplete: (goal) {
                            context.read<HomeCubit>().toggleGoal(goal.id);
                          },
                        ),
                      ]),
                    ),
                  ),
                ],
              );
            }

            if (state is Error) {
              return Center(
                child: Text(state.message),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
