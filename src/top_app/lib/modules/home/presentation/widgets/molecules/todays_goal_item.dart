import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/home/presentation/state_management/goals_cubit/goals_cubit.dart';
import 'package:top_app/modules/home/presentation/widgets/atoms/goal_checkbox.dart';
import 'package:top_app/shared/entities/templates/goal.dart';

class TodaysGoalItem extends StatefulWidget {
  const TodaysGoalItem({
    super.key,
    required this.goal,
    this.autoFocus = false,
  });

  final Goal goal;
  final bool autoFocus;

  @override
  State<TodaysGoalItem> createState() => _TodaysGoalItemState();
}

class _TodaysGoalItemState extends State<TodaysGoalItem> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;
  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.goal.name);
    _focusNode = FocusNode();
    if (widget.autoFocus) {
      _focusNode.requestFocus();
      _isEditing = true;
    }
  }

  @override
  void didUpdateWidget(TodaysGoalItem oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.goal.id != widget.goal.id) {
      _controller.text = widget.goal.name;
      _isEditing = false;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    final String newName = _controller.text.trim();
    if (newName.isEmpty) {
      context.read<GoalsCubit>().deleteGoal(widget.goal.id);
    } else {
      context.read<GoalsCubit>().editGoalName(widget.goal.id, newName);
    }
    setState(() {
      _isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final bool isCompleted = widget.goal.completion == 1.0;

    return Dismissible(
      key: Key(widget.goal.id),
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
        context.read<GoalsCubit>().deleteGoal(widget.goal.id);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: <Widget>[
            GoalCheckbox(
              isCompleted: isCompleted,
              onTap: () {
                context.read<GoalsCubit>().toggleGoal(widget.goal.id);
              },
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _isEditing
                  ? TextField(
                      controller: _controller,
                      focusNode: _focusNode,
                      textCapitalization: TextCapitalization.sentences,
                      style: AppTextStyles.regular14,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                      onSubmitted: (_) => _handleSubmit(),
                      onEditingComplete: _handleSubmit,
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          _isEditing = true;
                          _focusNode.requestFocus();
                        });
                      },
                      child: Text(
                        widget.goal.name,
                        style: AppTextStyles.regular14.copyWith(
                          color: isCompleted ? AppColors.grayNeutral : null,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
