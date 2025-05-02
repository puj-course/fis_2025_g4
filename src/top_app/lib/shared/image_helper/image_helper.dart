import 'package:injectable/injectable.dart';
import 'package:top_app/core/providers/firebase_provider.dart';
import 'package:top_app/shared/image_helper/remove_image.dart' as remove_image;
import 'package:top_app/shared/image_helper/upload_image.dart' as upload_image;
import 'package:top_app/shared/image_helper/pick_image.dart' as pick_image;
import 'package:top_app/shared/image_helper/pick_image.dart' show ImageSourceType;

/// Helper class that encapsulates image operations.
@injectable
class ImageHelper {
  final FirebaseProvider firebaseProvider;

  ImageHelper({required this.firebaseProvider});

  /// Uploads an image to Firebase Storage and returns the download URL.
  Future<String> uploadImage(String path, String imagePath) async {
    return await upload_image.uploadImage(path, imagePath, firebaseProvider);
  }

  Future<void> removeImage(String path, String imagePath) async {
    return await remove_image.removeImage(path, imagePath, firebaseProvider);
  }

  /// Picks an image from the specified source and returns the temporary file path
  Future<String?> pickImage(ImageSourceType sourceType) async {
    return await pick_image.pickImage(sourceType);
  }
}
