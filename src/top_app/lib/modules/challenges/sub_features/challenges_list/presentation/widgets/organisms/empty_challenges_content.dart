import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';

class EmptyChallengesContent extends StatelessWidget {
  const EmptyChallengesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            '🎯',
            style: TextStyle(fontSize: 48),
          ),
          const SizedBox(height: 16),
          Text(
            'There are no challenges yet,\ncheck back later!',
            style: AppTextStyles.regular16,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
