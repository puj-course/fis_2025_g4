import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nested/nested.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/modules/home/presentation/state_management/goals_cubit/goals_cubit.dart';
import 'package:top_app/modules/home/presentation/state_management/activities_cubit/activities_cubit.dart';
import 'package:top_app/modules/home/presentation/widgets/molecules/activities_shimmer.dart';
import 'package:top_app/modules/home/presentation/widgets/molecules/app_bar_shimmer.dart';
import 'package:top_app/modules/home/presentation/widgets/molecules/goals_shimmer.dart';
import 'package:top_app/modules/home/presentation/widgets/organisms/home_app_bar.dart';
import 'package:top_app/modules/home/presentation/widgets/organisms/todays_activities_section.dart';
import 'package:top_app/modules/home/presentation/widgets/organisms/todays_goals_section.dart';
import 'package:top_app/shared/entities/templates/activity.dart';
import 'package:top_app/shared/global_state/user/domain/state_management/cubit/user_cubit.dart';

@RoutePage()
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().getUser();
    return MultiBlocProvider(
      providers: <SingleChildWidget>[
        BlocProvider<ActivitiesCubit>.value(
          value: GetIt.I<ActivitiesCubit>(),
        ),
        BlocProvider<GoalsCubit>.value(
          value: GetIt.I<GoalsCubit>(),
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
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: BlocBuilder<UserCubit, UserState>(
          builder: (BuildContext context, UserState state) {
            if (state is Authenticated) {
              return HomeAppBar(user: state.user);
            }
            return const AppBarShimmer();
          },
        ),
      ),
      backgroundColor: AppColors.blackPrimary,
      body: RefreshIndicator(
        onRefresh: () async {
          print('Refreshing...');
          await context.read<UserCubit>().getUser();
          await context.read<ActivitiesCubit>().getUserChallenges();
          context.read<GoalsCubit>().loadGoals();
        },
        child: CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate(<Widget>[
                  //? Activities Section
                  Text(
                    'Activities',
                    style: AppTextStyles.bold18,
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<ActivitiesCubit, ActivitiesState>(
                    builder: (BuildContext context, ActivitiesState activitiesState) {
                      if (activitiesState is Loaded) {
                        return TodaysActivitiesSection(
                          activities:
                              context.read<ActivitiesCubit>().todaysActivities ?? <Activity>[],
                        );
                      }
                      return const ActivitiesShimmer();
                    },
                  ),
                  const SizedBox(height: 24),

                  //? Goals Section
                  Text('Goals', style: AppTextStyles.bold18),
                  const SizedBox(height: 16),
                  BlocBuilder<GoalsCubit, GoalsState>(
                    builder: (BuildContext context, GoalsState goalsState) {
                      if (goalsState is LoadedGoals) {
                        return TodaysGoalsSection(goals: goalsState.goals);
                      }
                      return const GoalsShimmer();
                    },
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
