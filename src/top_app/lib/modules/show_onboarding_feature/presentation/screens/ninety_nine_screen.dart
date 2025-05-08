import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/widgets/onboarding_page.dart';
import 'package:typewritertext/typewritertext.dart';

import '../molecules/person_grid.dart';

@RoutePage()
class NinetyNineScreen extends StatelessWidget {
  const NinetyNineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: OnboardingPage(
        nextRoute: const ThatOneRoute(),
        indicatorDelay: const Duration(seconds: 5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TypeWriter.text(
                'Because you don\'t want to be part of the 99% of people',
                style: AppTextStyles.regular16,
                textAlign: TextAlign.center,
                duration: const Duration(milliseconds: 50),
              ),
              const SizedBox(height: 60),
              SizedBox(
                height: screenHeight * 0.45,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: PersonGrid(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
