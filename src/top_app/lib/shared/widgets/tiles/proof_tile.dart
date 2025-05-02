import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_icon.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';

class ProofTile extends StatelessWidget {
  const ProofTile({
    super.key,
    required this.name,
    required this.icon,
    this.onTap,
  });

  final String name;
  final AppIcon icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.blackSecondary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                icon.assetPath,
                width: 20,
                height: 20,
              ),
            ),
            const SizedBox(width: 16),
            Text(
              name,
              style: AppTextStyles.regular14,
            ),
          ],
        ),
      ),
    );
  }
}
