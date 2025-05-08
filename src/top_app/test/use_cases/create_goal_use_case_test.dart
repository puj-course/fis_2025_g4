import 'package:flutter_test/flutter_test.dart';
import 'package:top_app/modules/home/domain/usecases/goals/create_goal_usecase.dart';
import 'package:top_app/shared/entities/templates/goal.dart';

void main() {
  final CreateGoalUsecase useCase = CreateGoalUsecase();

  test('crear meta con nombre válido', () {
    final List<Goal> result = useCase('Read 10 pages', <Goal>[]);
    expect(result.length, 1);
    expect(result.first.name, 'Read 10 pages');
    expect(result.first.dueDate.hour, 23);
    expect(result.first.dueDate.minute, 59);
  });
}
