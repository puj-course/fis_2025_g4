import 'package:injectable/injectable.dart';
import 'package:top_app/core/providers/firebase_provider.dart';
import 'dart:convert';

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

  /// Gets the rank of a user based on their sign up time
  Future<int> getUserSignUpRank(int signUpSeconds) async {
    try {
      // Get the URL of the deployed function
      final functionUrl =
          'https://us-central1-top-app-cbef2.cloudfunctions.net/get_user_sign_up_rank';

      // Create the request headers and body
      final headers = {
        'Content-Type': 'application/json',
      };

      final body = jsonEncode({
        'signUpSeconds': signUpSeconds,
      });

      // Make the HTTP POST request
      final response = await firebaseProvider.httpClient.post(
        Uri.parse(functionUrl),
        headers: headers,
        body: body,
      );

      // Check if the request was successful
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        return responseData['rank'];
      } else {
        throw Exception('Failed to get user rank: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      rethrow;
    }
  }
}
