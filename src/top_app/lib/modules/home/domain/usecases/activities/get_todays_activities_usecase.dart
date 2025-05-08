import 'package:injectable/injectable.dart';
import 'package:top_app/shared/entities/templates/activity.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';

@injectable
class GetTodaysActivitiesUsecase {
  List<Activity> call(List<Challenge> challenges) {
    final int today = DateTime.now().weekday;
    final List<Activity> activities = <Activity>[];

    for (final Challenge challenge in challenges) {
      for (final Activity activity in challenge.activities) {
        if (activity.daysOfWeek.contains(today)) {
          activities.add(activity);
        }
      }
    }

    return activities;
  }
}
