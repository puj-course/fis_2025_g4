import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_icon.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/shared/widgets/chips/icon_text_chip.dart';

class ActivityCard extends StatelessWidget {
  const ActivityCard({
    super.key,
    required this.name,
    required this.icon,
    this.streakEdge,
    this.onTap,
    this.trailing,
  });

  final String name;

  final int? streakEdge;
  final AppIcon icon;

  final VoidCallback? onTap;

  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: AppColors.blackTertiary,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.grayDark,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Image.asset(
                icon.assetPath,
                width: 32,
                height: 32,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: AppTextStyles.regular14,
                  ),
                  const SizedBox(height: 8),
                  if (streakEdge != null)
                    IconNumberChip(
                      icon: Image.asset(
                        AppIcon.diamond.assetPath,
                        width: 16,
                        height: 16,
                      ),
                      number: streakEdge!,
                      text: 'Edge',
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: trailing ?? const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
