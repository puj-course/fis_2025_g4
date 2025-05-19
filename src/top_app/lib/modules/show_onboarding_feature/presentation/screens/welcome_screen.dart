import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/widgets/onboarding_page.dart';

import '../atoms/has_account_text_button.dart';

@RoutePage()
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPage(
        nextRoute: const YourLiveChangesRoute(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Welcome to', style: AppTextStyles.regular20),
            const SizedBox(height: 10),
            Text('T.O.P',
                style:
                    AppTextStyles.bold26.copyWith(fontSize: 80.0, fontFamily: 'Times New Roman')),
            const SizedBox(height: 20),
            const HasAccountTextButton(),
          ],
        ),
      ),
    );
  }
}
