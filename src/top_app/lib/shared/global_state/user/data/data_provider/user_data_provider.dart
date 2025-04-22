import 'package:injectable/injectable.dart';
import 'package:top_app/core/providers/firebase_provider.dart';
import 'package:top_app/shared/cloud_functions/cloud_functions_helper.dart';

import '../../domain/entity/user_entity.dart';
import '../model/user_model.dart';

@injectable
class UserDataProvider {
  final FirebaseProvider firebaseProvider;
  final CloudFunctionsHelper _cloudFunctionsHelper;

  UserDataProvider({
    required this.firebaseProvider,
    required CloudFunctionsHelper cloudFunctionsHelper,
  }) : _cloudFunctionsHelper = cloudFunctionsHelper;

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

  /// Gets the rank of a user based on their sign up time
  Future<int> getUserSignUpRank(int signUpSeconds) async {
    try {
      final response = await _cloudFunctionsHelper.callFunction(
        functionName: 'get_user_sign_up_rank',
        method: HttpMethod.post,
        body: {'signUpSeconds': signUpSeconds},
      );

      return response['rank'];
    } catch (e) {
      rethrow;
    }
  }
}
