import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@LazySingleton()
class FirebaseProvider {
  FirebaseProvider();

  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

  FirebaseFirestore get firestore => FirebaseFirestore.instance;

  FirebaseFunctions get functions => FirebaseFunctions.instance;

  FirebaseStorage get storage => FirebaseStorage.instance;

  http.Client get httpClient => http.Client();
}
