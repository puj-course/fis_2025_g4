import 'package:image_picker/image_picker.dart';

/// Enum to specify the source of the image
enum ImageSourceType {
  gallery,
  camera,
}

/// Picks an image from the specified source and returns the temporary file path
Future<String?> pickImage(ImageSourceType sourceType) async {
  final ImagePicker picker = ImagePicker();
  XFile? pickedFile;

  try {
    switch (sourceType) {
      case ImageSourceType.gallery:
        pickedFile = await picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 80,
        );
        break;
      case ImageSourceType.camera:
        pickedFile = await picker.pickImage(
          source: ImageSource.camera,
          imageQuality: 80,
        );
        break;
    }

    return pickedFile?.path;
  } catch (e) {
    print('Error picking image: $e');
    return null;
  }
}
