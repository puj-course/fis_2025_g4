import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_icon.dart';

class NotificationBell extends StatelessWidget {
  const NotificationBell({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.blackSecondary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(
        AppIcon.bell.assetPath,
        width: 24,
        height: 24,
      ),
    );
  }
}
