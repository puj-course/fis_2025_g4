import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';

class CenteredLoader extends StatelessWidget {
  const CenteredLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColors.whitePrimary,
      ),
    );
  }
}
