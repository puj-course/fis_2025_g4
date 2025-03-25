import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repository/sign_up_repository.dart';
import '../data_provider/sign_up_data_provider.dart';

@Injectable(as: SignUpRepository)
class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpDataProvider _signUpApiProvider;

  SignUpRepositoryImpl({required SignUpDataProvider signUpApiProvider})
      : _signUpApiProvider = signUpApiProvider;

  @override
  Future<User?> signUp(String email, String password) async {
    try {
      return await _signUpApiProvider.signUp(email, password);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          throw Exception('This email is already in use by another account');
        case 'invalid-email':
          throw Exception('Please enter a valid email address');
        case 'weak-password':
          throw Exception('Please enter a stronger password (at least 6 characters)');
        default:
          throw Exception(e.toString());
      }
    }
  }
}
