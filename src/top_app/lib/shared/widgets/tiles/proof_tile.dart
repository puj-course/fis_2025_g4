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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.blackTertiary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                icon.assetPath,
                width: 22,
                height: 22,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                name,
                style: AppTextStyles.regular14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
