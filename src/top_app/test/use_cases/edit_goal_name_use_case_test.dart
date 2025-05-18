import 'package:flutter_test/flutter_test.dart';
import 'package:top_app/modules/home/domain/usecases/goals/edit_goal_name_usecase.dart';
import 'package:top_app/shared/entities/templates/goal.dart';

void main() {
  final EditGoalNameUsecase useCase = EditGoalNameUsecase();

  group('EditGoalNameUsecase', () {
    test('should update goal name when goal exists', () {
      // Arrange
      final List<Goal> goals = <Goal>[
        Goal(
          id: 'goal1',
          name: 'Old Name',
          createdAt: DateTime.now(),
          completion: 0.0,
          type: 'instant',
          dueDate: DateTime.now(),
        ),
        Goal(
          id: 'goal2',
          name: 'Another Goal',
          createdAt: DateTime.now(),
          completion: 0.0,
          type: 'instant',
          dueDate: DateTime.now(),
        ),
      ];

      // Act
      final List<Goal> result = useCase('goal1', 'New Name', goals);

      // Assert
      expect(result.length, equals(2));
      expect(result[0].name, equals('New Name'));
      expect(result[1].name, equals('Another Goal'));
    });

    test('should not modify goals when goal ID does not exist', () {
      // Arrange
      final List<Goal> goals = <Goal>[
        Goal(
          id: 'goal1',
          name: 'Goal 1',
          createdAt: DateTime.now(),
          completion: 0.0,
          type: 'instant',
          dueDate: DateTime.now(),
        ),
      ];

      // Act
      final List<Goal> result = useCase('nonexistent', 'New Name', goals);

      // Assert
      expect(result.length, equals(1));
      expect(result[0].name, equals('Goal 1'));
    });

    test('should handle empty goals list', () {
      // Arrange
      final List<Goal> emptyGoals = <Goal>[];

      // Act
      final List<Goal> result = useCase('goal1', 'New Name', emptyGoals);

      // Assert
      expect(result, isEmpty);
    });

    test('should preserve all goal properties when updating name', () {
      // Arrange
      final DateTime now = DateTime.now();
      final List<Goal> goals = <Goal>[
        Goal(
          id: 'goal1',
          name: 'Old Name',
          createdAt: now,
          completion: 0.5,
          type: 'instant',
          dueDate: now.add(const Duration(days: 1)),
        ),
      ];

      // Act
      final List<Goal> result = useCase('goal1', 'New Name', goals);

      // Assert
      expect(result.length, equals(1));
      expect(result[0].id, equals('goal1'));
      expect(result[0].name, equals('New Name'));
      expect(result[0].createdAt, equals(now));
      expect(result[0].completion, equals(0.5));
      expect(result[0].type, equals('instant'));
      expect(result[0].dueDate, equals(now.add(const Duration(days: 1))));
    });
  });
}
