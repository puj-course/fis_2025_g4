import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    this.spacing = 15,
  });

  final double spacing;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: spacing),
        const Divider(color: AppColors.grayDark),
        SizedBox(height: spacing),
      ],
    );
  }
}
