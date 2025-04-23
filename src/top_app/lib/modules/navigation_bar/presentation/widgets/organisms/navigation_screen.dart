import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/modules/navigation_bar/presentation/widgets/molecules/bottom_navigation_bar.dart';
import 'package:top_app/shared/widgets/snackbars/custom_snackbar.dart';

@RoutePage()
class NavigationScreen extends StatelessWidget {
  const NavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter.tabBar(
      physics: const NeverScrollableScrollPhysics(),
      routes: const <PageRouteInfo<Object?>>[
        HomeRoute(),
        ShowChallengesListRoute(),
        HomeRoute(), // Placeholder for Tribe
        HomeRoute(), // Placeholder for Profile
      ],
      builder: (BuildContext context, Widget child, TabController controller) {
        final TabsRouter tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: CustomBottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (int index) {
              if (index == 2 || index == 3) {
                CustomSnackBar.info(context, 'Coming soon!');
                return;
              }
              tabsRouter.setActiveIndex(index);
            },
          ),
        );
      },
    );
  }
}
