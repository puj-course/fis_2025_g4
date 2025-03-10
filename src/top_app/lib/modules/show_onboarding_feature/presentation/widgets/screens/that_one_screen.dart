import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/widgets/molecules/person_grid.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/widgets/molecules/swipe_up_indicator.dart';
import 'package:typewritertext/typewritertext.dart';

@RoutePage()
class ThatOneScreen extends StatelessWidget {
  const ThatOneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          // Check if the swipe was upward (negative velocity)
          if (details.velocity.pixelsPerSecond.dy < -10) {
            // Navigate to the StartOrLevelUpScreen
            context.router.navigate(const StartOrLevelUpRoute());
          }
        },
        child: SafeArea(
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Main content centered vertically
              Positioned.fill(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TypeWriter.text(
                          'You chose to be that one',
                          style: AppTextStyles.regular16,
                          textAlign: TextAlign.center,
                          duration: const Duration(milliseconds: 50),
                        ),
                        const SizedBox(height: 60),
                        SizedBox(
                          height: screenHeight * 0.45,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: PersonGrid(
                              mode: PersonGridMode.highlightOne,
                              highlightIndex: 12, // Middle position
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              // Swipe up indicator at the bottom
              const Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: SwipeUpIndicator(
                  customText: 'Swipe up to continue',
                  delay: Duration(seconds: 5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
