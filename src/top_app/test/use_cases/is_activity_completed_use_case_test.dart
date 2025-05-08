import 'package:flutter_test/flutter_test.dart';
import 'package:top_app/modules/home/domain/usecases/activities/is_activity_completed_usecase.dart';
import 'package:top_app/shared/entities/user_specific/user_activity_progress.dart';
import 'package:top_app/shared/entities/user_specific/user_challenge.dart';
import 'package:top_app/shared/entities/user_specific/user_proof.dart';
import 'package:top_app/shared/entities/templates/proof.dart';

void main() {
  final IsActivityCompletedUsecase useCase = IsActivityCompletedUsecase();

  test('prueba presente hoy debe retornar true', () {
    final DateTime today = DateTime.now();
    final UserProof proof = UserProof(
      proofId: 'test_proof_1',
      type: ProofType.text,
      submittedText: 'Completed activity',
      submittedImageUrls: <String>[],
      localImagePaths: <String>[],
      submittedAt: today,
      isValid: true,
    );

    final UserActivityProgress progress = UserActivityProgress(
      activityId: 'run',
      currentStreak: 1,
      dailyProofs: <DateTime, UserProof>{today: proof},
    );

    final UserChallenge challenge = UserChallenge(
      challengeId: 'test_challenge_1',
      dateStarted: today,
      currentStreak: 1,
      bestStreak: 1,
      completion: 0.0,
      activities: <UserActivityProgress>[progress],
    );

    final bool result = useCase(activityId: 'run', userChallenges: <UserChallenge>[challenge]);
    expect(result, isTrue);
  });

  test('sin prueba hoy debe retornar false', () {
    final DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
    final UserProof proof = UserProof(
      proofId: 'test_proof_2',
      type: ProofType.text,
      submittedText: 'Completed activity',
      submittedImageUrls: <String>[],
      localImagePaths: <String>[],
      submittedAt: yesterday,
      isValid: true,
    );

    final UserActivityProgress progress = UserActivityProgress(
      activityId: 'run',
      currentStreak: 1,
      dailyProofs: <DateTime, UserProof>{yesterday: proof},
    );

    final UserChallenge challenge = UserChallenge(
      challengeId: 'test_challenge_2',
      dateStarted: yesterday,
      currentStreak: 1,
      bestStreak: 1,
      completion: 0.0,
      activities: <UserActivityProgress>[progress],
    );

    final bool result = useCase(activityId: 'run', userChallenges: <UserChallenge>[challenge]);
    expect(result, isFalse);
  });
}
