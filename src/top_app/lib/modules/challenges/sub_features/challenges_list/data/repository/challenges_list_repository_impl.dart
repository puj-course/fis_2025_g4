import 'package:injectable/injectable.dart';
import 'package:top_app/modules/challenges/sub_features/challenges_list/data/data_provider/challenges_list_data_provider.dart';
import 'package:top_app/modules/challenges/sub_features/challenges_list/domain/repository/challenges_list_repository.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';
import 'package:top_app/shared/models/templates/challenge_model.dart';

@Injectable(as: ChallengesListRepository)
class ChallengesListRepositoryImpl implements ChallengesListRepository {
  final ChallengesListDataProvider _showChallengesListDataProvider;

  ChallengesListRepositoryImpl({required ChallengesListDataProvider showChallengesListDataProvider})
      : _showChallengesListDataProvider = showChallengesListDataProvider;

  @override
  Future<List<Challenge>> getChallenges() async {
    try {
      final List<ChallengeModel> challenges = await _showChallengesListDataProvider.getChallenges();
      return challenges.map((ChallengeModel challenge) => challenge.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }
}
