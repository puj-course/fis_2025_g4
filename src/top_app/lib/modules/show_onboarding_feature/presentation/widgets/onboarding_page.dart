import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import '../molecules/swipe_up_indicator.dart';

class OnboardingPage extends StatelessWidget {
  final Widget child;
  final PageRouteInfo nextRoute;
  final bool showSwipeIndicator;
  final Duration? indicatorDelay;

  const OnboardingPage({
    super.key,
    required this.child,
    required this.nextRoute,
    this.showSwipeIndicator = true,
    this.indicatorDelay,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.vertical,
      onPageChanged: (int index) {
        if (index == 1) {
          AutoRouter.of(context).navigate(nextRoute);
        }
      },
      children: <Widget>[
        SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(child: child),
              if (showSwipeIndicator)
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SwipeUpIndicator(
                    delay: indicatorDelay ?? const Duration(seconds: 2),
                  ),
                ),
            ],
          ),
        ),
        // Empty page to trigger navigation
        Container(),
      ],
    );
  }
}
