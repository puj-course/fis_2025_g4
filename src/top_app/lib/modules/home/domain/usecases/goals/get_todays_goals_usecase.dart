import 'package:injectable/injectable.dart';
import 'package:top_app/shared/entities/templates/goal.dart';

@injectable
class GetTodaysGoalsUsecase {
  List<Goal> call(List<Goal> goals) {
    final DateTime today = DateTime.now();
    return goals.where((Goal goal) {
      return goal.dueDate.year == today.year &&
          goal.dueDate.month == today.month &&
          goal.dueDate.day == today.day;
    }).toList();
  }
}
