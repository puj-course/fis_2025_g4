import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/molecules/swipe_up_indicator.dart';

import '../atoms/has_account_text_button.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          // Check if the swipe was upward (negative velocity)
          if (details.velocity.pixelsPerSecond.dy < -10) {
            // Using navigate instead of replace for better transition effect
            AutoRouter.of(context).navigate(const YourLiveChangesRoute());
          }
        },
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Welcome to', style: AppTextStyles.regular20),
                      const SizedBox(height: 10),
                      Text('T.O.P', style: AppTextStyles.bold26.copyWith(fontSize: 40.0)),
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20),
                child: SwipeUpIndicator(
                  delay: Duration(seconds: 2),
                ),
              ),
              HasAccountTextButton(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
