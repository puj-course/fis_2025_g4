import 'package:injectable/injectable.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenges_list/data/data_provider/show_challenges_list_data_provider.dart';
import 'package:top_app/modules/show_challenges_feature/sub_features/show_challenges_list/domain/repository/show_challenges_list_repository.dart';
import 'package:top_app/shared/entities/templates/challenge.dart';

@Injectable(as: ShowChallengesListRepository)
class ShowChallengesListRepositoryImpl implements ShowChallengesListRepository {
  final ShowChallengesListDataProvider _showChallengesListDataProvider;

  ShowChallengesListRepositoryImpl(
      {required ShowChallengesListDataProvider showChallengesListDataProvider})
      : _showChallengesListDataProvider = showChallengesListDataProvider;

  @override
  Future<List<Challenge>> getChallenges() async {
    try {
      final challenges = await _showChallengesListDataProvider.getChallenges();
      return challenges.map((challenge) => challenge.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }
}
