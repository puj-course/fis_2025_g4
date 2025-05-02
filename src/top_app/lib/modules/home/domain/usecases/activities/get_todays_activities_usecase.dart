import 'package:injectable/injectable.dart';
import 'package:top_app/shared/entities/templates/activity.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';

@injectable
class GetTodaysActivitiesUsecase {
  List<Activity> call(List<Challenge> challenges) {
    final today = DateTime.now().weekday;
    final activities = <Activity>[];

    for (final challenge in challenges) {
      for (final activity in challenge.activities) {
        if (activity.daysOfWeek.contains(today)) {
          activities.add(activity);
        }
      }
    }

    return activities;
  }
}
