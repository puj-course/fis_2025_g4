import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/molecules/swipe_up_indicator.dart';
import 'package:typewritertext/typewritertext.dart';

@RoutePage()
class YourLiveChangesScreen extends StatelessWidget {
  const YourLiveChangesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          // Check if the swipe was upward (negative velocity)
          if (details.velocity.pixelsPerSecond.dy < -10) {
            // Navigate to the NinetyNineScreen
            context.router.navigate(const NinetyNineRoute());
          }
        },
        child: SafeArea(
          child: Stack(
            children: [
              Positioned(
                top: screenHeight * 0.2,
                left: 0,
                right: 0,
                child: TypeWriter.text(
                  'Today, your life changes...',
                  style: AppTextStyles.regular16,
                  textAlign: TextAlign.center,
                  duration: const Duration(milliseconds: 100),
                ),
              ),
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: SwipeUpIndicator(
                  customText: 'Swipe up to continue',
                  delay: const Duration(seconds: 3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
