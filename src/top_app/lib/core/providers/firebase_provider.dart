import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class FirebaseProvider {
  FirebaseProvider();

  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  FirebaseFirestore get firestore => FirebaseFirestore.instance;
}
