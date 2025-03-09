import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/widgets/molecules/swipe_up_indicator.dart';

import '../molecules/person_grid.dart';

@RoutePage()
class NinetyNineScreen extends StatelessWidget {
  const NinetyNineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          // Check if the swipe was upward (negative velocity)
          if (details.velocity.pixelsPerSecond.dy < -10) {
            // Navigate to the next screen (to be implemented)
            // AutoRouter.of(context).navigate(const NextRoute());
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
                        RichText(
                          textAlign: TextAlign.center,
                          text: const TextSpan(
                            style: AppTextStyles.regular16,
                            children: [
                              TextSpan(text: 'Because you don\'t want to be part of the '),
                              TextSpan(
                                text: '99%',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              TextSpan(text: ' of people'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 60),
                        SizedBox(
                          height: screenHeight * 0.45, // Adjust this value as needed
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: PersonGrid(),
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
