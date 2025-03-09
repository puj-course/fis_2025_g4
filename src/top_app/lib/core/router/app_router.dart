import 'package:auto_route/auto_route.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/widgets/screens/welcome_screen.dart';

import 'app_route_names.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();

  @override
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: AppRouteNames.welcome,
          page: WelcomeRoute.page,
          initial: true,
        ),
      ];
}
