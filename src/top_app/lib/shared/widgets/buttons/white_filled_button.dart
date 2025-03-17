import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';

class WhiteFilledButton extends StatelessWidget {
  const WhiteFilledButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.hasHaptic = true,
    this.isLoading = false,
  });

  final String text;
  final void Function() onPressed;
  final bool hasHaptic;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (hasHaptic) {
          HapticFeedback.lightImpact();
        }
        onPressed();
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.whitePrimary,
        foregroundColor: AppColors.blackPrimary,
        padding: const EdgeInsets.symmetric(vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: isLoading
          ? const SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                color: AppColors.blackPrimary,
              ),
            )
          : Text(text, style: AppTextStyles.regular16.copyWith(color: AppColors.blackPrimary)),
    );
  }
}
