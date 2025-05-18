import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:top_app/core/theme/app_colors.dart';

class GoalCheckbox extends StatelessWidget {
  const GoalCheckbox({
    super.key,
    required this.isCompleted,
    required this.onTap,
  });

  final bool isCompleted;
  final VoidCallback onTap;

  void _handleTap() {
    HapticFeedback.mediumImpact();
    onTap();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        alignment: Alignment.center,
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isCompleted ? AppColors.whitePrimary : Colors.transparent,
          border: Border.all(
            color: isCompleted ? AppColors.whitePrimary : AppColors.grayMidDark,
            width: 2,
          ),
        ),
        child: isCompleted
            ? Center(
                child: Icon(
                  Icons.check,
                  color: AppColors.blackPrimary,
                  size: 16,
                ),
              )
            : null,
      ),
    );
  }
}
