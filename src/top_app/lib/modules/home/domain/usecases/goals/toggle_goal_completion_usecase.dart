import 'package:injectable/injectable.dart';
import 'package:top_app/shared/entities/templates/goal.dart';

@injectable
class ToggleGoalCompletionUsecase {
  ToggleGoalCompletionUsecase();

  List<Goal> call({required String goalId, required List<Goal> currentGoals}) {
    return currentGoals.map((Goal goal) {
      if (goal.id == goalId) {
        return goal.copyWith(completion: goal.completion == 1.0 ? 0.0 : 1.0);
      }
      return goal;
    }).toList();
  }
}
