import 'package:injectable/injectable.dart';
import 'package:top_app/shared/entities/templates/goal.dart';

@injectable
class EditGoalNameUsecase {
  EditGoalNameUsecase();

  List<Goal> call(String goalId, String newName, List<Goal> currentGoals) {
    return currentGoals
        .map((Goal goal) => goal.id == goalId ? goal.copyWith(name: newName) : goal)
        .toList();
  }
}
