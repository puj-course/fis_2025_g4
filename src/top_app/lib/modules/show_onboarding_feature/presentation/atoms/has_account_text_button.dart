import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';

class HasAccountTextButton extends StatelessWidget {
  const HasAccountTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        // TODO: Navigate to login screen
      },
      child: Text(
        'Already have an account? press here',
        style: AppTextStyles.regular14.copyWith(
          decoration: TextDecoration.underline,
          decorationColor: AppColors.whitePrimary,
        ),
      ),
    );
  }
}
