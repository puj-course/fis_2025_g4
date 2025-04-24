import 'package:injectable/injectable.dart';
import 'package:top_app/shared/entities/templates/goal.dart';
import 'package:uuid/uuid.dart';

@injectable
class CreateGoalUsecase {
  CreateGoalUsecase();

  List<Goal> call(String name, List<Goal> currentGoals) {
    final DateTime dueDate =
        DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 23, 59, 59);

    final Goal goal = Goal(
      id: Uuid().v4(),
      name: name,
      createdAt: DateTime.now(),
      completion: 0,
      dueDate: dueDate,
      type: 'instant',
    );

    return <Goal>[...currentGoals, goal];
  }
}
