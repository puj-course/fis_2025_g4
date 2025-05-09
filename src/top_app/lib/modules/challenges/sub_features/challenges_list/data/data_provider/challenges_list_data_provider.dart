import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/core/providers/firebase_provider.dart';
import 'package:top_app/shared/models/templates/challenge_model.dart';

@injectable
class ChallengesListDataProvider {
  final FirebaseProvider _firebaseProvider;

  ChallengesListDataProvider({required FirebaseProvider firebaseProvider})
      : _firebaseProvider = firebaseProvider;

  Future<List<ChallengeModel>> getChallenges() async {
    try {
      final QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await _firebaseProvider.firestore.collection('challenges').get();

      final List<ChallengeModel> challenges = querySnapshot.docs
          .map((QueryDocumentSnapshot<Map<String, dynamic>> doc) =>
              ChallengeModel.fromJson(doc.data()))
          .toList();

      return challenges;
    } catch (e) {
      throw Exception('Failed to fetch challenges: ${e.toString()}');
    }
  }
}
