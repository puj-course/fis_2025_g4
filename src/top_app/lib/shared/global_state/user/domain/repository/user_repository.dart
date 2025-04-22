import '../entity/user_entity.dart';

abstract class UserRepository {
  /// Creates a user document in the database
  Future<void> createUserDocument(UserEntity user);

  /// Updates a user document in the database
  Future<void> updateUserDocument(UserEntity user);

  /// Gets a user document from the database
  Future<UserEntity?> getUserDocument(String uid);

  /// Gets the rank of a user based on their sign up time
  Future<int> getUserSignUpRank(int signUpSeconds);
}
