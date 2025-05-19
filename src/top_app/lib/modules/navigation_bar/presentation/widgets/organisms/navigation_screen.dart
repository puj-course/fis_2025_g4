import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/modules/navigation_bar/presentation/widgets/molecules/bottom_navigation_bar.dart';
import 'package:top_app/shared/global_state/user/domain/state_management/cubit/user_cubit.dart';
import 'package:top_app/shared/widgets/snackbars/custom_snackbar.dart';

@RoutePage()
class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      physics: const NeverScrollableScrollPhysics(),
      homeIndex: 0,
      routes: const <PageRouteInfo<Object?>>[
        HomeRoute(),
        ChallengesListRoute(),
        HomeRoute(), // Placeholder for Tribe
        // Placeholder for Profile
        Add2faRoute(),
      ],
      builder: (BuildContext context, Widget child, TabController controller) {
        final TabsRouter tabsRouter = AutoTabsRouter.of(context);
        return BlocListener<UserCubit, UserState>(
          listener: (BuildContext context, UserState state) {
            if (state is Unauthenticated) {
              AutoRouter.of(context).replace(const WelcomeRoute());
            }
          },
          child: Scaffold(
            body: child,
            bottomNavigationBar: CustomBottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: (int index) {
                if (index == 2) {
                  CustomSnackBar.info(context, 'Coming soon!');
                  return;
                }
                tabsRouter.setActiveIndex(index);
              },
            ),
          ),
        );
      },
    );
  }
}
