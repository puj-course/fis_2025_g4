import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/home/presentation/widgets/atoms/goal_checkbox.dart';
import 'package:top_app/shared/entities/templates/goal.dart';

class TodaysGoalItem extends StatelessWidget {
  const TodaysGoalItem({
    super.key,
    required this.goal,
    required this.onComplete,
  });

  final Goal goal;
  final VoidCallback onComplete;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GoalCheckbox(
          isCompleted: goal.completion == 1.0,
          onTap: onComplete,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Text(
            goal.name,
            style: AppTextStyles.regular14,
          ),
        ),
      ],
    );
  }
}
