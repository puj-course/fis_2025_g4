import 'package:injectable/injectable.dart';
import 'package:top_app/shared/entities/templates/goal.dart';

@injectable
class DeleteGoalUsecase {
  DeleteGoalUsecase();

  List<Goal> call(String goalId, List<Goal> currentGoals) {
    return currentGoals.where((Goal goal) => goal.id != goalId).toList();
  }
}
