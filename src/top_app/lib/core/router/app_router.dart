import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/screens/ninety_nine_screen.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/screens/start_or_level_up_screen.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/screens/that_one_screen.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/screens/top_is_the_place_screen.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/screens/welcome_screen.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/screens/your_live_changes_screen.dart';
import 'package:top_app/modules/show_sign_in_feature/presentation/screens/sign_in_screen.dart';
import 'package:top_app/modules/show_sign_up_freature/presentation/screens/sign_up_screen.dart';
import 'package:top_app/modules/show_sign_up_freature/sub_features/show_countdown_record/presentation/screens/countdown_record_screen.dart';

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
        CustomRoute(
          path: AppRouteNames.thatOne,
          page: ThatOneRoute.page,
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
          path: AppRouteNames.startOrLevelUp,
          page: StartOrLevelUpRoute.page,
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
          page: TopIsThePlaceRoute.page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
        ),
        AutoRoute(
          path: AppRouteNames.signUp,
          page: SignUpRoute.page,
          // initial: true,
        ),
        AutoRoute(
          page: CountdownRecordRoute.page,
          path: AppRouteNames.countdownRecord,
        ),
        AutoRoute(
          page: SignInRoute.page,
          path: AppRouteNames.signIn,
        ),
      ];
}
