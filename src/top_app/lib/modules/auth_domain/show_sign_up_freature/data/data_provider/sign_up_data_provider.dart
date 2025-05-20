import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/core/providers/firebase_provider.dart';

@injectable
class SignUpDataProvider {
  final FirebaseProvider _firebaseProvider;
  SignUpDataProvider(this._firebaseProvider);

  Future<User?> signUp(String email, String password) async {
    try {
      final UserCredential userCredential = await _firebaseProvider.firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
