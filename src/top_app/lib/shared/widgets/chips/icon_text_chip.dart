import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/shared/utils/numbers/prettify_number.dart';

class IconNumberChip extends StatelessWidget {
  const IconNumberChip({
    super.key,
    required this.icon,
    required this.number,
    this.text,
  });

  final Widget icon;
  final int number;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.grayDark,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          icon,
          const SizedBox(width: 4),
          Text(
            '${prettifyNumber(number)} $text',
            style: AppTextStyles.bold12,
          ),
        ],
      ),
    );
  }
}
