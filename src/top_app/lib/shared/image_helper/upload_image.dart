import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:top_app/core/providers/firebase_provider.dart';

/// Uploads an image file to Firebase Storage and returns its download URL
///
/// Parameters:
/// - [path]: The destination path in Firebase Storage where the image will be stored
/// - [imagePath]: The local file path of the image to upload
/// - [firebaseProvider]: Provider that gives access to Firebase services
///
/// Returns a String containing the public download URL of the uploaded image
Future<String> uploadImage(String path, String imagePath, FirebaseProvider firebaseProvider) async {
  // Create a reference to the storage location where we'll upload the image
  final Reference storageReference = firebaseProvider.storage.ref(path);

  // Start uploading the image file to Firebase Storage
  final UploadTask uploadTask = storageReference.putFile(File(imagePath));

  // Wait for the upload to complete and get the task snapshot
  final TaskSnapshot taskSnapshot = await uploadTask;

  // Get the public download URL for the uploaded image
  final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

  return downloadUrl;
}
