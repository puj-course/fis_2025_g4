import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:top_app/core/providers/firebase_provider.dart';

@injectable
class SignInDataProvider {
  final FirebaseProvider _firebaseProvider;

  SignInDataProvider(this._firebaseProvider);

  Future<UserCredential> signIn(String email, String password) async {
    try {
      return await _firebaseProvider.firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      rethrow;
    }
  }
}
