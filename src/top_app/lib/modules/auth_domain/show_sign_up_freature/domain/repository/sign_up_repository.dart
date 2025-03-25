import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpRepository {
  /// Sign up with email and password
  ///
  /// [email] - user email
  /// [password] - user password
  ///
  /// Returns [User] if sign up is successful
  ///
  /// Throws [Exception] if sign up fails
  Future<User?> signUp(String email, String password);
}
