import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';

class CongratsTexts extends StatelessWidget {
  const CongratsTexts({super.key, required this.rank});

  final int rank;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
        Text('Well done!', style: AppTextStyles.extraBold24.copyWith(fontSize: 30)),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              children: <InlineSpan>[
                TextSpan(text: 'You\'re the ', style: AppTextStyles.regular14),
                TextSpan(text: '$rank° ', style: AppTextStyles.extraBold12),
                TextSpan(
                    text: 'fastest person in the world to complete our sign up process!',
                    style: AppTextStyles.regular12),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
