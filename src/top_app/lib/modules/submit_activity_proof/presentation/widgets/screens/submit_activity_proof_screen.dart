import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/di/injector.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/submit_activity_proof/presentation/state_management/cubit/submit_activity_proof_cubit.dart';
import 'package:top_app/shared/entities/templates/activity.dart';
import 'package:top_app/shared/entities/templates/proof.dart';
import 'package:top_app/shared/image_helper/pick_image.dart';
import 'package:top_app/shared/loaders/centered_loader.dart';
import 'package:top_app/shared/widgets/buttons/white_filled_button.dart';
import 'package:top_app/shared/widgets/snackbars/custom_snackbar.dart';
import 'package:top_app/shared/widgets/tiles/proof_tile.dart';
import 'package:top_app/modules/submit_activity_proof/presentation/widgets/organisms/text_proof_section.dart';
import 'package:top_app/shared/widgets/image_picker/image_picker_widget.dart';
import 'package:top_app/shared/image_helper/image_helper.dart';

/// Screen for submitting a proof for an activity.
///
/// [challengeId] is the id of the challenge that the activity belongs to.
/// [activity] is the activity that the proof is for.
@RoutePage()
class SubmitActivityProofScreen extends StatelessWidget {
  final Activity activity;
  const SubmitActivityProofScreen({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SubmitActivityProofCubit>(
      create: (BuildContext context) => getIt<SubmitActivityProofCubit>()..loadUserProof(activity),
      child: const SubmitActivityProofScreenBody(),
    );
  }
}

class SubmitActivityProofScreenBody extends StatelessWidget {
  const SubmitActivityProofScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SubmitActivityProofCubit, SubmitActivityProofState>(
      listener: (BuildContext context, SubmitActivityProofState state) {
        if (state is Error) {
          CustomSnackBar.error(context, 'Ocurrió un error: ${state.message}. Intenta nuevamente.');
        }
        if (state is ProofSubmitted) {
          CustomSnackBar.success(context, 'Proof submitted successfully');
          Navigator.of(context).pop();
        }
      },
      builder: (BuildContext context, SubmitActivityProofState state) {
        if (state is LoadingProofDetails) {
          return const CenteredLoader();
        }

        final SubmitActivityProofCubit cubit = context.read<SubmitActivityProofCubit>();
        final Proof proofTemplate = cubit.proofTemplate;

        return Scaffold(
          appBar: AppBar(
            title: Text('Complete the activity', style: AppTextStyles.bold18),
          ),
          body: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text('Required Proof', style: AppTextStyles.bold16),
                        ProofTile(name: proofTemplate.name, icon: proofTemplate.icon),
                        Text('Your submission', style: AppTextStyles.bold16),
                        const SizedBox(height: 10),
                        if (proofTemplate.type == ProofType.text ||
                            proofTemplate.type == ProofType.textAndImage)
                          const TextProofSection(),
                        const SizedBox(height: 20),
                        if (proofTemplate.type == ProofType.image ||
                            proofTemplate.type == ProofType.textAndImage)
                          ImagePickerWidget(
                            height: 300,
                            imageSourceType: ImageSourceType.camera,
                            onImagePicked: (String path) async {
                              try {
                                await cubit.uploadImage(path);
                              } catch (e) {
                                CustomSnackBar.error(context, 'Error uploading image: $e');
                              }
                            },
                            onImageRemoved: () {
                              cubit.removeImage();
                            },
                            imageHelper: getIt<ImageHelper>(),
                          ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 32,
                    child: WhiteFilledButton(
                      text: 'Submit Proof',
                      onPressed: () async {
                        await cubit.submitProof();
                      },
                      isLoading: state is SubmittingProof,
                      isDone: state is ProofSubmitted,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
