import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';

class GreetingText extends StatelessWidget {
  const GreetingText({super.key});

  String _getGreeting() {
    final int hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good morning';
    } else if (hour < 17) {
      return 'Good afternoon';
    } else {
      return 'Good evening';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _getGreeting(),
      style: AppTextStyles.regular14,
    );
  }
}
