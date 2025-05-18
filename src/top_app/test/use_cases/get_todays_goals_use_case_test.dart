import 'package:flutter_test/flutter_test.dart';
import 'package:top_app/modules/home/domain/usecases/goals/get_todays_goals_usecase.dart';
import 'package:top_app/shared/entities/templates/goal.dart';

void main() {
  final GetTodaysGoalsUsecase useCase = GetTodaysGoalsUsecase();

  group('GetTodaysGoalsUsecase', () {
    test('should return only today\'s goals', () {
      // Arrange
      final DateTime today = DateTime.now();
      final DateTime tomorrow = today.add(const Duration(days: 1));
      final DateTime yesterday = today.subtract(const Duration(days: 1));

      final List<Goal> goals = <Goal>[
        Goal(
          id: 'goal1',
          name: 'Today\'s Goal',
          createdAt: today,
          completion: 0.0,
          type: 'instant',
          dueDate: today,
        ),
        Goal(
          id: 'goal2',
          name: 'Tomorrow\'s Goal',
          createdAt: today,
          completion: 0.0,
          type: 'instant',
          dueDate: tomorrow,
        ),
        Goal(
          id: 'goal3',
          name: 'Yesterday\'s Goal',
          createdAt: today,
          completion: 0.0,
          type: 'instant',
          dueDate: yesterday,
        ),
      ];

      // Act
      final List<Goal> result = useCase(goals);

      // Assert
      expect(result.length, equals(1));
      expect(result[0].id, equals('goal1'));
      expect(result[0].name, equals('Today\'s Goal'));
    });

    test('should handle empty goals list', () {
      // Arrange
      final List<Goal> emptyGoals = <Goal>[];

      // Act
      final List<Goal> result = useCase(emptyGoals);

      // Assert
      expect(result, isEmpty);
    });

    test('should handle goals with same date but different times', () {
      // Arrange
      final DateTime today = DateTime.now();
      final List<Goal> goals = <Goal>[
        Goal(
          id: 'goal1',
          name: 'Morning Goal',
          createdAt: today,
          completion: 0.0,
          type: 'instant',
          dueDate: DateTime(today.year, today.month, today.day, 9, 0),
        ),
        Goal(
          id: 'goal2',
          name: 'Evening Goal',
          createdAt: today,
          completion: 0.0,
          type: 'instant',
          dueDate: DateTime(today.year, today.month, today.day, 23, 59),
        ),
      ];

      // Act
      final List<Goal> result = useCase(goals);

      // Assert
      expect(result.length, equals(2));
      expect(result[0].name, equals('Morning Goal'));
      expect(result[1].name, equals('Evening Goal'));
    });

    test('should preserve goal properties when filtering', () {
      // Arrange
      final DateTime today = DateTime.now();
      final List<Goal> goals = <Goal>[
        Goal(
          id: 'goal1',
          name: 'Today\'s Goal',
          createdAt: today,
          completion: 0.5,
          type: 'instant',
          dueDate: today,
        ),
        Goal(
          id: 'goal2',
          name: 'Tomorrow\'s Goal',
          createdAt: today,
          completion: 0.7,
          type: 'instant',
          dueDate: today.add(const Duration(days: 1)),
        ),
      ];

      // Act
      final List<Goal> result = useCase(goals);

      // Assert
      expect(result.length, equals(1));
      expect(result[0].id, equals('goal1'));
      expect(result[0].name, equals('Today\'s Goal'));
      expect(result[0].createdAt, equals(today));
      expect(result[0].completion, equals(0.5));
      expect(result[0].type, equals('instant'));
      expect(result[0].dueDate, equals(today));
    });
  });
}
