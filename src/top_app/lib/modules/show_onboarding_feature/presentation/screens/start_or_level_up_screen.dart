import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/show_onboarding_feature/presentation/widgets/onboarding_page.dart';
import 'package:typewritertext/typewritertext.dart';

@RoutePage()
class StartOrLevelUpScreen extends StatefulWidget {
  const StartOrLevelUpScreen({super.key});

  @override
  State<StartOrLevelUpScreen> createState() => _StartOrLevelUpScreenState();
}

class _StartOrLevelUpScreenState extends State<StartOrLevelUpScreen> {
  final bool _showFirstText = true;
  bool _showSecondText = false;
  bool _switchIcons = false;

  @override
  void initState() {
    super.initState();
    _startSequence();
  }

  void _startSequence() async {
    // First text is shown immediately (typewriter starts)

    // After first text is done + 1 second delay, show second text
    await Future.delayed(
        const Duration(milliseconds: 4000)); // Slower timing for first text to complete
    if (mounted) {
      setState(() {
        _showSecondText = true;
        _switchIcons = true; // Switch icons when second text starts
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPage(
        nextRoute: const TopIsThePlaceRoute(),
        indicatorDelay: const Duration(seconds: 5),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // First section: Text then Dumbbell
              _showFirstText
                  ? TypeWriter.text(
                      'Whether you are just starting out your journey',
                      style: AppTextStyles.regular16,
                      textAlign: TextAlign.center,
                      duration: const Duration(milliseconds: 80), // Slower typing
                    )
                  : const SizedBox.shrink(),

              const SizedBox(height: 50),

              SvgPicture.asset(
                _switchIcons
                    ? 'assets/icons/dumbbell_obscured_icon.svg'
                    : 'assets/icons/dumbbell_icon.svg',
                width: 80,
                height: 80,
              ),

              const SizedBox(height: 40),

              // Second section: Text then Book
              _showSecondText
                  ? TypeWriter.text(
                      'Or you found yourself stuck and don\'t know how to level up',
                      style: AppTextStyles.regular16,
                      textAlign: TextAlign.center,
                      duration: const Duration(milliseconds: 80), // Slower typing
                    )
                  : const SizedBox.shrink(),

              const SizedBox(height: 50),

              SvgPicture.asset(
                _switchIcons ? 'assets/icons/book_icon.svg' : 'assets/icons/book_obscured_icon.svg',
                width: 80,
                height: 80,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
