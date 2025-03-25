import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';

class UnderlinedTextButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const UnderlinedTextButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          minimumSize: Size.zero,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        child: Text(
          text,
          style: AppTextStyles.regular14.copyWith(
            color: AppColors.grayMidLight,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.grayMidLight,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
