import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:nested/nested.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/modules/home/presentation/state_management/goals_cubit/goals_cubit.dart';
import 'package:top_app/modules/home/presentation/state_management/activities_cubit/activities_cubit.dart';
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
    return MultiBlocProvider(
      providers: <SingleChildWidget>[
        BlocProvider<UserCubit>.value(
          value: GetIt.I<UserCubit>()..fetchUser(),
        ),
        BlocProvider<ActivitiesCubit>.value(
          value: GetIt.I<ActivitiesCubit>(),
        ),
        BlocProvider<GoalsCubit>.value(
          value: GetIt.I<GoalsCubit>()..loadGoals(),
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
      listener: (BuildContext context, UserState state) {
        if (state is Unauthenticated) {
          AutoRouter.of(context).replace(const WelcomeRoute());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.blackPrimary,
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              floating: true,
              pinned: true,
              expandedHeight: 0,
              flexibleSpace: BlocBuilder<UserCubit, UserState>(
                builder: (BuildContext context, UserState userState) {
                  if (userState is Authenticated) {
                    return HomeAppBar(user: userState.user);
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(16),
              sliver: SliverList(
                delegate: SliverChildListDelegate(<Widget>[
                  //? Activities Section
                  Text(
                    "Today's Activities",
                    style: AppTextStyles.bold18,
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<ActivitiesCubit, ActivitiesState>(
                    builder: (BuildContext context, ActivitiesState activitiesState) {
                      return TodaysActivitiesSection(
                        activities:
                            context.read<ActivitiesCubit>().todaysActivities ?? <Activity>[],
                        onActivityTap: (Activity activity) {
                          print('Activity tapped: ${activity.name}');
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 24),

                  //? Goals Section
                  Text("Today's Goals", style: AppTextStyles.bold18),
                  const SizedBox(height: 16),
                  BlocBuilder<GoalsCubit, GoalsState>(
                    builder: (BuildContext context, GoalsState goalsState) {
                      return TodaysGoalsSection(goals: context.read<GoalsCubit>().goals);
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
