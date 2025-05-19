import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/widgets/onboarding_page.dart';
import 'package:typewritertext/typewritertext.dart';

@RoutePage()
class YourLiveChangesScreen extends StatelessWidget {
  const YourLiveChangesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPage(
        nextRoute: const NinetyNineRoute(),
        indicatorDelay: const Duration(seconds: 3),
        child: Stack(
          children: <Widget>[
            Positioned(
              top: MediaQuery.of(context).size.height * 0.2,
              left: 0,
              right: 0,
              child: TypeWriter.text(
                'Today, your life changes...',
                style: AppTextStyles.regular16,
                textAlign: TextAlign.center,
                duration: const Duration(milliseconds: 100),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
