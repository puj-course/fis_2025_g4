// ignore_for_file: always_specify_types

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_app/modules/add_2fa/widgets/screens/add_2fa_screen.dart';
import 'package:top_app/modules/home/presentation/pages/home_screen.dart';
import 'package:top_app/modules/navigation_bar/presentation/widgets/organisms/navigation_screen.dart';
import 'package:top_app/modules/challenges/sub_features/challenge_detail/presentation/widgets/screens/challenge_detail_screen.dart';
import 'package:top_app/modules/challenges/sub_features/challenges_list/presentation/widgets/screens/challenges_list_screen.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/screens/ninety_nine_screen.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/screens/start_or_level_up_screen.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/screens/that_one_screen.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/screens/top_is_the_place_screen.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/screens/welcome_screen.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/screens/your_live_changes_screen.dart';
import 'package:top_app/modules/auth_domain/show_sign_in_feature/presentation/screens/sign_in_screen.dart';
import 'package:top_app/modules/auth_domain/show_sign_up_freature/presentation/screens/sign_up_screen.dart';
import 'package:top_app/modules/auth_domain/show_sign_up_freature/sub_features/show_countdown_record/presentation/screens/countdown_record_screen.dart';
import 'package:top_app/modules/submit_activity_proof/presentation/widgets/screens/submit_activity_proof_screen.dart';
import 'package:top_app/shared/entities/templates/activity.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';

import 'app_route_names.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  List<AutoRoute> get routes => <AutoRoute>[
        CustomRoute(
          path: AppRouteNames.welcome,
          page: WelcomeRoute.page,
          transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) {
            return child;
          },
          duration: Duration.zero,
        ),
        CustomRoute(
          path: AppRouteNames.yourLiveChanges,
          page: YourLiveChangesRoute.page,
          transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) {
            const Offset begin = Offset(0.0, 1.0);
            const Offset end = Offset.zero;
            const Cubic curve = Curves.easeInOut;

            Animatable<Offset> tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            Animation<Offset> offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
          duration: const Duration(milliseconds: 300),
        ),
        CustomRoute(
          path: AppRouteNames.ninetyNine,
          page: NinetyNineRoute.page,
          transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) {
            const Offset begin = Offset(0.0, 1.0);
            const Offset end = Offset.zero;
            const Cubic curve = Curves.easeInOut;

            Animatable<Offset> tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            Animation<Offset> offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
          duration: const Duration(milliseconds: 300),
        ),
        CustomRoute(
          path: AppRouteNames.thatOne,
          page: ThatOneRoute.page,
          transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) {
            const Offset begin = Offset(0.0, 1.0);
            const Offset end = Offset.zero;
            const Cubic curve = Curves.easeInOut;

            Animatable<Offset> tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            Animation<Offset> offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
          duration: const Duration(milliseconds: 300),
        ),
        CustomRoute(
          path: AppRouteNames.startOrLevelUp,
          page: StartOrLevelUpRoute.page,
          transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) {
            const Offset begin = Offset(0.0, 1.0);
            const Offset end = Offset.zero;
            const Cubic curve = Curves.easeInOut;

            Animatable<Offset> tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            Animation<Offset> offsetAnimation = animation.drive(tween);

            return SlideTransition(position: offsetAnimation, child: child);
          },
          duration: const Duration(milliseconds: 300),
        ),
        CustomRoute(
          page: TopIsThePlaceRoute.page,
          transitionsBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation, Widget child) {
            const Offset begin = Offset(0.0, 1.0);
            const Offset end = Offset.zero;
            const Cubic curve = Curves.easeInOut;

            Animatable<Offset> tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            Animation<Offset> offsetAnimation = animation.drive(tween);

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
          // initial: true,
        ),
        AutoRoute(
          page: ChallengeDetailRoute.page,
          path: AppRouteNames.challengeDetail,
        ),
        AutoRoute(
          initial: true,
          page: NavigationRoute.page,
          path: AppRouteNames.navigation,
          children: <AutoRoute>[
            AutoRoute(
              page: HomeRoute.page,
              path: AppRouteNames.home,
            ),
            AutoRoute(
              page: ChallengesListRoute.page,
              path: AppRouteNames.challengesList,
            ),
            AutoRoute(
              page: Add2faRoute.page,
              path: AppRouteNames.add2fa,
            ),
          ],
        ),
        AutoRoute(
          page: SubmitActivityProofRoute.page,
          path: AppRouteNames.submitActivityProof,
        ),
      ];
}
