import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/widgets/screens/ninety_nine_screen.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/widgets/screens/welcome_screen.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/widgets/screens/your_live_changes_screen.dart';

import 'app_route_names.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: AppRouteNames.welcome,
          page: WelcomeRoute.page,
          initial: true,
        ),
        CustomRoute(
          path: AppRouteNames.yourLiveChanges,
          page: YourLiveChangesRoute.page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
          duration: const Duration(milliseconds: 300),
        ),
        CustomRoute(
          path: AppRouteNames.ninetyNine,
          page: NinetyNineRoute.page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
          duration: const Duration(milliseconds: 300),
        ),
      ];
}
