import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';

class GoalCheckbox extends StatelessWidget {
  const GoalCheckbox({
    super.key,
    required this.isCompleted,
    required this.onTap,
  });

  final bool isCompleted;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color: isCompleted ? AppColors.whitePrimary : AppColors.grayMidDark,
            width: 2,
          ),
          color: isCompleted ? AppColors.whitePrimary : Colors.transparent,
        ),
        child: isCompleted
            ? Center(
                child: Icon(
                  Icons.check,
                  color: AppColors.whitePrimary,
                ),
              )
            : null,
      ),
    );
  }
}
