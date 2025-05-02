import 'dart:io';
import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/shared/image_helper/image_helper.dart';
import 'package:top_app/shared/image_helper/pick_image.dart';
import 'package:top_app/shared/loaders/centered_loader.dart';

class ImagePickerWidget extends StatelessWidget {
  final bool isLoading;
  final String? imagePath;
  final Function(String) onImagePicked;
  final Function() onImageRemoved;
  final ImageHelper imageHelper;
  final ImageSourceType imageSourceType;

  const ImagePickerWidget({
    super.key,
    required this.imagePath,
    required this.onImagePicked,
    required this.onImageRemoved,
    required this.imageHelper,
    this.isLoading = false,
    this.imageSourceType = ImageSourceType.gallery,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final String? path = await imageHelper.pickImage(imageSourceType);
        if (path != null) {
          onImagePicked(path);
        }
      },
      child: Container(
        height: 200,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.grayMidLight),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            if (isLoading)
              const CenteredLoader()
            else if (imagePath != null)
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.file(
                  File(imagePath!),
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              )
            else
              const Icon(
                Icons.image_outlined,
                size: 48,
                color: AppColors.grayMidLight,
              ),
            if (imagePath != null)
              Positioned(
                bottom: 16,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.grayMidLight),
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                    onPressed: onImageRemoved,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
