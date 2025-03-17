import 'package:injectable/injectable.dart';
import 'package:top_app/core/providers/firebase_provider.dart';

import '../../domain/entity/user_entity.dart';
import '../model/user_model.dart';

@injectable
class UserDataProvider {
  final FirebaseProvider firebaseProvider;

  UserDataProvider({required this.firebaseProvider});

  /// Creates a user document in the database
  Future<void> createUserDocument(UserEntity user) async {
    try {
      await firebaseProvider.firestore
          .collection('users')
          .doc(user.uid)
          .set(UserModel.fromEntity(user).toJson());
    } catch (e) {
      rethrow;
    }
  }

  /// Gets a user document from the database
  Future<UserEntity> getUserDocument(String uid) async {
    try {
      final doc = await firebaseProvider.firestore.collection('users').doc(uid).get();
      return UserModel.fromJson(doc.data() ?? {}).toEntity();
    } catch (e) {
      rethrow;
    }
  }
}
