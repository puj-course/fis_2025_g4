import 'package:firebase_storage/firebase_storage.dart';
import 'package:top_app/core/providers/firebase_provider.dart';

Future<void> removeImage(String path, String imagePath, FirebaseProvider firebaseProvider) async {
  final Reference storageReference = firebaseProvider.storage.ref(path);
  await storageReference.delete();
}
