import 'package:injectable/injectable.dart';
import 'package:top_app/modules/home/domain/repository/home_repository.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';
import 'package:top_app/shared/models/templates/challenge_model.dart';

/// Get the challenges that the user is participating in
///
/// [challengeIds] is the list of challenge ids that the user is participating in
///
/// Returns a list of [Challenge] entities

@injectable
class GetUserChallengesUsecase {
  final HomeRepository _homeRepository;

  GetUserChallengesUsecase({required HomeRepository homeRepository})
      : _homeRepository = homeRepository;

  Future<List<Challenge>> call(List<String> challengeIds) async {
    if (challengeIds.isEmpty) {
      return <Challenge>[];
    }

    final List<ChallengeModel> modelChallenges =
        await _homeRepository.getUserChallenges(challengeIds);

    return modelChallenges.map((ChallengeModel model) => model.toEntity()).toList();
  }
}
