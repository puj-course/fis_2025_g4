import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@injectable
class SignUpApiProvider {
  final FirebaseAuth _firebaseAuth;

  SignUpApiProvider({required FirebaseAuth firebaseAuth}) : _firebaseAuth = firebaseAuth;

  Future<User?> signUp(String email, String password) async {
    try {
      final userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
