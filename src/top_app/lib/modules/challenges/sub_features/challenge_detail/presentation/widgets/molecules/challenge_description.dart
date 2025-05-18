import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';

class ChallengeDescription extends StatelessWidget {
  const ChallengeDescription({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Description',
          style: AppTextStyles.bold18,
        ),
        const SizedBox(height: 8),
        Text(
          description,
          style: AppTextStyles.regular14,
        ),
      ],
    );
  }
}
