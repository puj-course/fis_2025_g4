import 'package:injectable/injectable.dart';
import 'package:top_app/core/providers/firebase_provider.dart';
import 'package:top_app/modules/home/domain/repository/home_repository.dart';
import 'package:top_app/shared/models/templates/challenge_model.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl implements HomeRepository {
  final FirebaseProvider _firebaseProvider;

  HomeRepositoryImpl({required FirebaseProvider firebaseProvider})
      : _firebaseProvider = firebaseProvider;

  @override
  Future<List<ChallengeModel>> getUserChallenges(List<String> challengeIds) async {
    final challenges = await _firebaseProvider.firestore
        .collection('challenges')
        .where('id', whereIn: challengeIds)
        .get();

    return challenges.docs.map((doc) => ChallengeModel.fromJson(doc.data())).toList();
  }
}
