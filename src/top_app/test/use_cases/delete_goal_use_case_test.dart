import 'package:flutter_test/flutter_test.dart';
import 'package:top_app/modules/home/domain/usecases/goals/delete_goal_usecase.dart';
import 'package:top_app/shared/entities/templates/goal.dart';

void main() {
  final DeleteGoalUsecase useCase = DeleteGoalUsecase();

  group('DeleteGoalUsecase', () {
    test('should remove goal when it exists', () {
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
        Goal(
          id: 'goal2',
          name: 'Goal 2',
          createdAt: DateTime.now(),
          completion: 0.0,
          type: 'instant',
          dueDate: DateTime.now(),
        ),
      ];

      // Act
      final List<Goal> result = useCase('goal1', goals);

      // Assert
      expect(result.length, equals(1));
      expect(result[0].id, equals('goal2'));
    });

    test('should return same list when goal ID does not exist', () {
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
      final List<Goal> result = useCase('nonexistent', goals);

      // Assert
      expect(result.length, equals(1));
      expect(result[0].id, equals('goal1'));
    });

    test('should handle empty goals list', () {
      // Arrange
      final List<Goal> emptyGoals = <Goal>[];

      // Act
      final List<Goal> result = useCase('goal1', emptyGoals);

      // Assert
      expect(result, isEmpty);
    });

    test('should preserve remaining goals properties', () {
      // Arrange
      final DateTime now = DateTime.now();
      final List<Goal> goals = <Goal>[
        Goal(
          id: 'goal1',
          name: 'Goal 1',
          createdAt: now,
          completion: 0.5,
          type: 'instant',
          dueDate: now.add(const Duration(days: 1)),
        ),
        Goal(
          id: 'goal2',
          name: 'Goal 2',
          createdAt: now,
          completion: 0.7,
          type: 'instant',
          dueDate: now.add(const Duration(days: 2)),
        ),
      ];

      // Act
      final List<Goal> result = useCase('goal1', goals);

      // Assert
      expect(result.length, equals(1));
      expect(result[0].id, equals('goal2'));
      expect(result[0].name, equals('Goal 2'));
      expect(result[0].createdAt, equals(now));
      expect(result[0].completion, equals(0.7));
      expect(result[0].type, equals('instant'));
      expect(result[0].dueDate, equals(now.add(const Duration(days: 2))));
    });
  });
}
