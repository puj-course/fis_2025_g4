import 'dart:io';
import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/shared/image_helper/image_helper.dart';
import 'package:top_app/shared/image_helper/pick_image.dart';
import 'package:top_app/shared/loaders/centered_loader.dart';

class ImagePickerWidget extends StatefulWidget {
  final bool isLoading;
  final Function(String) onImagePicked;
  final Function() onImageRemoved;
  final ImageHelper imageHelper;
  final ImageSourceType imageSourceType;
  final double? height;
  final double? width;

  const ImagePickerWidget({
    super.key,
    required this.onImagePicked,
    required this.onImageRemoved,
    required this.imageHelper,
    this.isLoading = false,
    this.imageSourceType = ImageSourceType.gallery,
    this.height,
    this.width,
  });

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  String? _localImagePath;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        GestureDetector(
          onTap: () async {
            final String? path = await widget.imageHelper.pickImage(widget.imageSourceType);
            if (path != null) {
              setState(() {
                _localImagePath = path;
              });
              widget.onImagePicked(path);
            }
          },
          child: Container(
            height: widget.height ?? 200,
            width: widget.width ?? double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.grayNeutral),
              borderRadius: BorderRadius.circular(12),
            ),
            child: widget.isLoading
                ? const CenteredLoader()
                : _localImagePath != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          File(_localImagePath!),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      )
                    : Icon(
                        widget.imageSourceType == ImageSourceType.camera
                            ? Icons.camera_alt_outlined
                            : Icons.image_outlined,
                        size: 48,
                        color: AppColors.grayMidLight,
                      ),
          ),
        ),
        if (_localImagePath != null)
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: IconButton(
              onPressed: () {
                setState(() {
                  _localImagePath = null;
                });
                widget.onImageRemoved();
              },
              icon: const Icon(Icons.delete_outline, color: Colors.red),
              style: IconButton.styleFrom(
                backgroundColor: AppColors.grayDark,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
