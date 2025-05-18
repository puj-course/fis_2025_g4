import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/home/presentation/state_management/goals_cubit/goals_cubit.dart';
import 'package:top_app/modules/home/presentation/widgets/molecules/todays_goal_item.dart';
import 'package:top_app/shared/entities/templates/goal.dart';

class TodaysGoalsSection extends StatelessWidget {
  const TodaysGoalsSection({
    super.key,
    required this.goals,
  });

  final List<Goal> goals;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        goals.isEmpty
            ? Center(
                child: Text(
                  'No goals for today, start creating some! 🎯',
                  style: AppTextStyles.regular14,
                  textAlign: TextAlign.center,
                ),
              )
            : ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: goals.length,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                separatorBuilder: (BuildContext context, int index) => const Divider(
                  color: AppColors.blackTertiary,
                ),
                itemBuilder: (BuildContext context, int index) {
                  final Goal goal = goals[index];
                  return TodaysGoalItem(
                    goal: goal,
                    autoFocus: goals.last.name.isEmpty ? index == goals.length - 1 : false,
                  );
                },
              ),
        const SizedBox(height: 12),
        IconButton(
          onPressed: () {
            context.read<GoalsCubit>().addGoal('');
          },
          icon: const Icon(Icons.add),
        )
      ],
    );
  }
}
