import 'package:injectable/injectable.dart';
import 'package:top_app/core/providers/firebase_provider.dart';
import 'package:top_app/shared/image_helper/upload_image.dart' as upload_image;

/// Helper class that encapsulates image operations.
@injectable
class ImageHelper {
  final FirebaseProvider firebaseProvider;

  ImageHelper({required this.firebaseProvider});

  /// Uploads an image to Firebase Storage and returns the download URL.
  Future<String> uploadImage(String path, String imagePath) async {
    return await upload_image.uploadImage(path, imagePath, firebaseProvider);
  }
}
