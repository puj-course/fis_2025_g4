import 'package:injectable/injectable.dart';
import 'package:top_app/modules/challenges/sub_features/challenge_detail/data/data_provider/challenge_detail_data_provider.dart';
import 'package:top_app/modules/challenges/sub_features/challenge_detail/data/models/competitor_info_model.dart';
import 'package:top_app/modules/challenges/sub_features/challenge_detail/domain/entities/competitor_info.dart';
import 'package:top_app/modules/challenges/sub_features/challenge_detail/domain/repository/challenge_detail_repository.dart';
import 'package:top_app/shared/global_state/user/api/user_public_api.dart';
import 'package:top_app/shared/global_state/user/domain/entity/user_entity.dart';

@Injectable(as: ChallengeDetailRepository)
class ChallengeDetailRepositoryImpl implements ChallengeDetailRepository {
  final ChallengeDetailDataProvider _challengeDetailDataProvider;
  final UserPublicApi _userPublicApi;

  ChallengeDetailRepositoryImpl(
      {required ChallengeDetailDataProvider challengeDetailDataProvider,
      required UserPublicApi userPublicApi})
      : _challengeDetailDataProvider = challengeDetailDataProvider,
        _userPublicApi = userPublicApi;

  @override
  Future<List<CompetitorInfo>> getCompetitorsInfo(String challengeId) async {
    try {
      if (challengeId.isEmpty) {
        throw Exception('Challenge ID cannot be empty');
      }

      final List<CompetitorInfoModel> competitorInfoModels =
          await _challengeDetailDataProvider.getCompetitorInfo(challengeId);

      return competitorInfoModels.map((CompetitorInfoModel model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Failed to get competitors info: $e');
    }
  }

  @override
  Future<void> joinChallenge(String challengeId) async {
    try {
      UserEntity? user = await _userPublicApi.getUser();
      if (user == null) {
        throw Exception('User not found');
      }

      await _challengeDetailDataProvider.joinChallenge(user.uid, challengeId);
    } catch (e) {
      throw Exception('Failed to join challenge: $e');
    }
  }
}
