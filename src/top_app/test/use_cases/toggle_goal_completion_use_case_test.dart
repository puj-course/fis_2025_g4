import 'package:flutter_test/flutter_test.dart';
import 'package:top_app/modules/home/domain/usecases/goals/toggle_goal_completion_usecase.dart';
import 'package:top_app/shared/entities/templates/goal.dart';

void main() {
  final ToggleGoalCompletionUsecase useCase = ToggleGoalCompletionUsecase();

  test('cambiar estado de completion de 0.0 a 1.0', () {
    final Goal goal = Goal(
      id: 'abc',
      name: 'Meta',
      completion: 0.0,
      createdAt: DateTime.now(),
      type: '',
      dueDate: DateTime.now(),
    );
    final List<Goal> result = useCase(goalId: 'abc', currentGoals: <Goal>[goal]);

    expect(result.first.completion, 1.0);
  });

  test('cambiar estado de completion de 1.0 a 0.0', () {
    final Goal goal = Goal(
      id: 'abc',
      name: 'Meta',
      completion: 1.0,
      createdAt: DateTime.now(),
      type: '',
      dueDate: DateTime.now(),
    );
    final List<Goal> result = useCase(goalId: 'abc', currentGoals: <Goal>[goal]);

    expect(result.first.completion, 0.0);
  });
}
