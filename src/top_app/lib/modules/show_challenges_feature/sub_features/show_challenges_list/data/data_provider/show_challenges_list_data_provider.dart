import 'package:injectable/injectable.dart';
import 'package:top_app/core/providers/firebase_provider.dart';
import 'package:top_app/shared/models/templates/challenge_model.dart';

@injectable
class ShowChallengesListDataProvider {
  final FirebaseProvider _firebaseProvider;

  ShowChallengesListDataProvider({required FirebaseProvider firebaseProvider})
      : _firebaseProvider = firebaseProvider;

  Future<List<ChallengeModel>> getChallenges() async {
    try {
      final querySnapshot = await _firebaseProvider.firestore.collection('challenges').get();

      final challenges =
          querySnapshot.docs.map((doc) => ChallengeModel.fromJson(doc.data())).toList();

      return challenges;
    } catch (e) {
      throw Exception('Failed to fetch challenges: ${e.toString()}');
    }
  }
}
