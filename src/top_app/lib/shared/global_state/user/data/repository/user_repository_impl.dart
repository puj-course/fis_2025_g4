import 'package:injectable/injectable.dart';
import 'package:top_app/shared/global_state/user/domain/entity/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Import Firestore package
import '../../domain/repository/user_repository.dart';
import '../data_provider/user_data_provider.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  final UserDataProvider userDataProvider;

  UserRepositoryImpl({required this.userDataProvider});

  @override
  Future<void> createUserDocument(UserEntity user) async {
    try {
      await userDataProvider.createUserDocument(user);
    } catch (e) {
      if (e is FirebaseException) {
        // Handle Firestore specific exceptions
        switch (e.code) {
          case 'permission-denied':
            throw Exception('You do not have permission to perform this action.');
          case 'not-found':
            throw Exception('The specified document was not found.');
          case 'already-exists':
            throw Exception('A document with this ID already exists.');
          case 'unavailable':
            throw Exception('The service is currently unavailable. Please try again later.');
          default:
            throw Exception('An unknown error occurred: ${e.message}');
        }
      } else {
        // Handle other exceptions
        throw Exception('An error occurred: $e');
      }
    }
  }

  @override
  Future<UserEntity?> getUserDocument(String uid) async {
    try {
      return await userDataProvider.getUserDocument(uid);
    } catch (e) {
      if (e is FirebaseException) {
        // Handle Firestore specific exceptions
        switch (e.code) {
          case 'permission-denied':
            throw Exception('You do not have permission to access this document.');
          case 'not-found':
            return null;
          default:
            throw Exception('An unknown error occurred: ${e.message}');
        }
      } else {
        // Handle other exceptions
        throw Exception('An error occurred: $e');
      }
    }
  }

  @override
  Future<int> getUserSignUpRank(int signUpSeconds) async {
    try {
      return await userDataProvider.getUserSignUpRank(signUpSeconds);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> updateUserDocument(UserEntity user) async {
    try {
      await userDataProvider.updateUserDocument(user);
    } catch (e) {
      rethrow;
    }
  }
}
