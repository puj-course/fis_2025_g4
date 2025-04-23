import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/home/presentation/state_management/goals_cubit/goals_cubit.dart';
import 'package:top_app/modules/home/presentation/widgets/atoms/goal_checkbox.dart';
import 'package:top_app/shared/entities/templates/goal.dart';

class TodaysGoalItem extends StatelessWidget {
  const TodaysGoalItem({
    super.key,
    required this.goal,
  });

  final Goal goal;

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = goal.completion == 1.0;

    return Dismissible(
      key: Key(goal.id),
      direction: DismissDirection.endToStart,
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 16),
        child: const Icon(
          Icons.delete_outline,
          color: Colors.white,
        ),
      ),
      onDismissed: (_) {
        context.read<GoalsCubit>().deleteGoal(goal.id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: <Widget>[
            GoalCheckbox(
              isCompleted: isCompleted,
              onTap: () {
                context.read<GoalsCubit>().toggleGoal(goal.id);
              },
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                goal.name,
                style: AppTextStyles.regular14.copyWith(
                  color: isCompleted ? AppColors.grayMidLight : null,
                  decoration: isCompleted ? TextDecoration.lineThrough : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
