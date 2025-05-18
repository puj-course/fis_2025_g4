import 'package:flutter_test/flutter_test.dart';
import 'package:top_app/core/theme/app_icon.dart';
import 'package:top_app/modules/home/domain/usecases/activities/get_todays_activities_usecase.dart';
import 'package:top_app/shared/entities/templates/activity.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';
import 'package:top_app/shared/entities/templates/proof.dart';

void main() {
  final GetTodaysActivitiesUsecase useCase = GetTodaysActivitiesUsecase();

  group('GetTodaysActivitiesUsecase', () {
    test('should return activities scheduled for today', () {
      // Arrange
      final int today = DateTime.now().weekday;
      final int tomorrow = (today % 7) + 1;
      final int yesterday = today == 1 ? 7 : today - 1;

      final List<Challenge> challenges = <Challenge>[
        Challenge(
          id: 'challenge1',
          name: 'Challenge 1',
          description: 'Description 1',
          thumbnailUrl: 'url1',
          icon: AppIcon.strongArm,
          duration: 7,
          edgeReward: 100,
          authorName: 'Author 1',
          authorId: 'author1',
          activities: <Activity>[
            Activity(
              id: 'activity1',
              name: 'Today\'s Activity',
              streakEdge: 3,
              icon: AppIcon.strongArm,
              daysOfWeek: <int>[today],
              proof: <Proof>[],
              challengeId: 'challenge1',
            ),
            Activity(
              id: 'activity2',
              name: 'Tomorrow\'s Activity',
              streakEdge: 3,
              icon: AppIcon.strongArm,
              daysOfWeek: <int>[tomorrow],
              proof: <Proof>[],
              challengeId: 'challenge1',
            ),
          ],
        ),
        Challenge(
          id: 'challenge2',
          name: 'Challenge 2',
          description: 'Description 2',
          thumbnailUrl: 'url2',
          icon: AppIcon.strongArm,
          duration: 7,
          edgeReward: 100,
          authorName: 'Author 2',
          authorId: 'author2',
          activities: <Activity>[
            Activity(
              id: 'activity3',
              name: 'Yesterday\'s Activity',
              streakEdge: 3,
              icon: AppIcon.strongArm,
              daysOfWeek: <int>[yesterday],
              proof: <Proof>[],
              challengeId: 'challenge2',
            ),
          ],
        ),
      ];

      // Act
      final List<Activity> result = useCase(challenges);

      // Assert
      expect(result.length, equals(1));
      expect(result[0].id, equals('activity1'));
      expect(result[0].name, equals('Today\'s Activity'));
    });

    test('should handle empty challenges list', () {
      // Arrange
      final List<Challenge> emptyChallenges = <Challenge>[];

      // Act
      final List<Activity> result = useCase(emptyChallenges);

      // Assert
      expect(result, isEmpty);
    });

    test('should handle challenges with no activities', () {
      // Arrange
      final List<Challenge> challenges = <Challenge>[
        Challenge(
          id: 'challenge1',
          name: 'Challenge 1',
          description: 'Description 1',
          thumbnailUrl: 'url1',
          icon: AppIcon.strongArm,
          duration: 7,
          edgeReward: 100,
          authorName: 'Author 1',
          authorId: 'author1',
          activities: <Activity>[],
        ),
      ];

      // Act
      final List<Activity> result = useCase(challenges);

      // Assert
      expect(result, isEmpty);
    });

    test('should return multiple activities from different challenges', () {
      // Arrange
      final int today = DateTime.now().weekday;
      final List<Challenge> challenges = <Challenge>[
        Challenge(
          id: 'challenge1',
          name: 'Challenge 1',
          description: 'Description 1',
          thumbnailUrl: 'url1',
          icon: AppIcon.strongArm,
          duration: 7,
          edgeReward: 100,
          authorName: 'Author 1',
          authorId: 'author1',
          activities: <Activity>[
            Activity(
              id: 'activity1',
              name: 'Activity 1',
              streakEdge: 3,
              icon: AppIcon.strongArm,
              daysOfWeek: <int>[today],
              proof: <Proof>[],
              challengeId: 'challenge1',
            ),
          ],
        ),
        Challenge(
          id: 'challenge2',
          name: 'Challenge 2',
          description: 'Description 2',
          thumbnailUrl: 'url2',
          icon: AppIcon.strongArm,
          duration: 7,
          edgeReward: 100,
          authorName: 'Author 2',
          authorId: 'author2',
          activities: <Activity>[
            Activity(
              id: 'activity2',
              name: 'Activity 2',
              streakEdge: 3,
              icon: AppIcon.strongArm,
              daysOfWeek: <int>[today],
              proof: <Proof>[],
              challengeId: 'challenge2',
            ),
          ],
        ),
      ];

      // Act
      final List<Activity> result = useCase(challenges);

      // Assert
      expect(result.length, equals(2));
      expect(result[0].id, equals('activity1'));
      expect(result[1].id, equals('activity2'));
    });

    test('should handle activities scheduled for multiple days', () {
      // Arrange
      final int today = DateTime.now().weekday;
      final int tomorrow = (today % 7) + 1;
      final List<Challenge> challenges = <Challenge>[
        Challenge(
          id: 'challenge1',
          name: 'Challenge 1',
          description: 'Description 1',
          thumbnailUrl: 'url1',
          icon: AppIcon.strongArm,
          duration: 7,
          edgeReward: 100,
          authorName: 'Author 1',
          authorId: 'author1',
          activities: <Activity>[
            Activity(
              id: 'activity1',
              name: 'Multi-day Activity',
              streakEdge: 3,
              icon: AppIcon.strongArm,
              daysOfWeek: <int>[today, tomorrow],
              proof: <Proof>[],
              challengeId: 'challenge1',
            ),
          ],
        ),
      ];

      // Act
      final List<Activity> result = useCase(challenges);

      // Assert
      expect(result.length, equals(1));
      expect(result[0].id, equals('activity1'));
      expect(result[0].name, equals('Multi-day Activity'));
    });
  });
}
