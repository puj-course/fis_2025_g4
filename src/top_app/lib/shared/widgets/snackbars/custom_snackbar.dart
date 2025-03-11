import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:top_app/core/theme/app_colors.dart';

class CustomSnackBar {
  static void info(BuildContext context, String message) {
    _showSnackBar(
      context,
      message,
      AppColors.whitePrimary,
      AppColors.blackPrimary,
      Icons.info_outline,
    );
  }

  static void success(BuildContext context, String message) {
    _showSnackBar(
      context,
      message,
      Colors.green,
      Colors.white,
      Icons.check_circle_outline,
    );
  }

  static void error(BuildContext context, String message) {
    _showSnackBar(
      context,
      message,
      Colors.red,
      Colors.white,
      Icons.error_outline,
    );
  }

  static void _showSnackBar(
    BuildContext context,
    String message,
    Color backgroundColor,
    Color textColor,
    IconData icon,
  ) {
    // Trigger haptic feedback
    HapticFeedback.lightImpact();

    // Hide any existing snackbars
    ScaffoldMessenger.of(context).hideCurrentSnackBar();

    // Show the new snackbar
    final snackBar = SnackBar(
      content: Row(
        children: [
          Icon(icon, color: textColor),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: TextStyle(color: textColor),
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
        bottom: MediaQuery.of(context).size.height - 100,
        left: 20,
        right: 20,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
