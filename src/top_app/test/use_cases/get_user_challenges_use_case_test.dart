import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:top_app/core/theme/app_icon.dart';
import 'package:top_app/modules/home/domain/repository/home_repository.dart';
import 'package:top_app/modules/home/domain/usecases/challenges/get_user_challenges_usecase.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';
import 'package:top_app/shared/models/templates/activity_model.dart';
import 'package:top_app/shared/models/templates/challenge_model.dart';

@GenerateMocks(<Type>[HomeRepository])
import 'get_user_challenges_use_case_test.mocks.dart';

void main() {
  late GetUserChallengesUsecase useCase;
  late MockHomeRepository mockRepository;

  setUp(() {
    mockRepository = MockHomeRepository();
    useCase = GetUserChallengesUsecase(homeRepository: mockRepository);
  });

  group('GetUserChallengesUsecase', () {
    test('should return empty list when challengeIds is empty', () async {
      // Arrange
      const List<String> emptyIds = <String>[];

      // Act
      final List<Challenge> result = await useCase(emptyIds);

      // Assert
      expect(result, isEmpty);
      verifyNever(mockRepository.getUserChallenges(any));
    });

    test('should return list of challenges for valid challengeIds', () async {
      // Arrange
      const List<String> challengeIds = <String>['challenge1', 'challenge2'];
      final List<ChallengeModel> mockChallenges = <ChallengeModel>[
        ChallengeModel(
          id: 'challenge1',
          name: 'Challenge 1',
          description: 'Description 1',
          thumbnailUrl: 'https://example.com/thumbnail1.jpg',
          icon: AppIcon.strongArm,
          duration: 30,
          edgeReward: 100,
          authorId: 'author1',
          authorName: 'Author 1',
          activities: <String, ActivityModel>{},
        ),
        ChallengeModel(
          id: 'challenge2',
          name: 'Challenge 2',
          description: 'Description 2',
          thumbnailUrl: 'https://example.com/thumbnail2.jpg',
          icon: AppIcon.strongArm,
          duration: 30,
          edgeReward: 100,
          authorId: 'author2',
          authorName: 'Author 2',
          activities: <String, ActivityModel>{},
        ),
      ];

      when(mockRepository.getUserChallenges(challengeIds)).thenAnswer((_) async => mockChallenges);

      // Act
      final List<Challenge> result = await useCase(challengeIds);

      // Assert
      expect(result.length, equals(2));
      expect(result[0].id, equals('challenge1'));
      expect(result[1].id, equals('challenge2'));
      verify(mockRepository.getUserChallenges(challengeIds)).called(1);
    });

    test('should handle repository errors gracefully', () async {
      // Arrange
      const List<String> challengeIds = <String>['challenge1'];
      when(mockRepository.getUserChallenges(challengeIds)).thenThrow(Exception('Repository error'));

      // Act & Assert
      expect(
        () => useCase(challengeIds),
        throwsException,
      );
      verify(mockRepository.getUserChallenges(challengeIds)).called(1);
    });
  });
}
