import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/home/presentation/widgets/molecules/todays_goal_item.dart';
import 'package:top_app/shared/entities/templates/goal.dart';

class TodaysGoalsSection extends StatelessWidget {
  const TodaysGoalsSection({
    super.key,
    required this.goals,
    required this.onGoalComplete,
  });

  final List<Goal> goals;
  final Function(Goal) onGoalComplete;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        goals.isEmpty
            ? Center(
                child: Text(
                  'No goals for today',
                  style: AppTextStyles.regular14,
                ),
              )
            : ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: goals.length,
                padding: EdgeInsets.zero,
                separatorBuilder: (context, index) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final goal = goals[index];
                  return TodaysGoalItem(
                    goal: goal,
                    onComplete: () => onGoalComplete(goal),
                  );
                },
              ),
        const SizedBox(height: 12),
        IconButton(
          onPressed: () {
            print('Add goal');
          },
          icon: const Icon(Icons.add),
        )
      ],
    );
  }
}
