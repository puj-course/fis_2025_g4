import 'package:collection/collection.dart';
import 'package:injectable/injectable.dart';

import 'package:top_app/shared/entities/user_specific/user_activity_progress.dart';
import 'package:top_app/shared/entities/user_specific/user_challenge.dart';

@injectable
class IsActivityCompletedUsecase {
  bool call({
    required String activityId,
    required List<UserChallenge> userChallenges,
  }) {
    // Get today's date at midnight for comparison
    final DateTime today = DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
    );

    // Check each challenge for the activity
    for (final UserChallenge challenge in userChallenges) {
      // Find the activity progress for this activity
      final UserActivityProgress? activityProgress = challenge.activities
          .firstWhereOrNull((UserActivityProgress a) => a.activityId == activityId);

      if (activityProgress != null) {
        // Check if there's a proof for today
        final bool hasProofForToday = activityProgress.dailyProofs.entries.any(
          (MapEntry<DateTime, dynamic> entry) {
            final DateTime proofDate = DateTime(
              entry.key.year,
              entry.key.month,
              entry.key.day,
            );
            return proofDate.isAtSameMomentAs(today);
          },
        );

        if (hasProofForToday) {
          return true;
        }
      }
    }

    return false;
  }
}
