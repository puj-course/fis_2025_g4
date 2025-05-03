import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/modules/submit_activity_proof/presentation/state_management/cubit/submit_activity_proof_cubit.dart';
import 'package:top_app/shared/image_helper/image_helper.dart';
import 'package:top_app/shared/widgets/image_picker/image_picker_widget.dart';
import 'package:top_app/shared/widgets/snackbars/custom_snackbar.dart';
import 'package:top_app/shared/image_helper/pick_image.dart';

class ImageProofSection extends StatelessWidget {
  final double height;
  final ImageHelper imageHelper;

  const ImageProofSection({
    super.key,
    this.height = 300,
    required this.imageHelper,
  });

  @override
  Widget build(BuildContext context) {
    return ImagePickerWidget(
      height: height,
      imageSourceType: ImageSourceType.camera,
      onImagePicked: (String path) async {
        try {
          await context.read<SubmitActivityProofCubit>().updateImage(path);
        } catch (e) {
          CustomSnackBar.error(context, 'Error updating image: $e');
        }
      },
      onImageRemoved: () {
        context.read<SubmitActivityProofCubit>().removeImage();
      },
      imageHelper: imageHelper,
    );
  }
}
