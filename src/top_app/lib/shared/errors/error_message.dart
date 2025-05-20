import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/shared/widgets/buttons/white_filled_button.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    super.key,
    required this.message,
    required this.onTryAgain,
  });

  final String message;
  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            message,
            style: AppTextStyles.regular16,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          WhiteFilledButton(
            text: 'Try Again',
            onPressed: onTryAgain,
          ),
        ],
      ),
    );
  }
}
