import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/di/injector.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/submit_activity_proof/presentation/state_management/cubit/submit_activity_proof_cubit.dart';
import 'package:top_app/shared/entities/templates/activity.dart';
import 'package:top_app/shared/entities/templates/proof.dart';
import 'package:top_app/shared/loaders/centered_loader.dart';
import 'package:top_app/shared/widgets/snackbars/custom_snackbar.dart';
import 'package:top_app/modules/submit_activity_proof/presentation/widgets/organisms/text_proof_section.dart';
import 'package:top_app/shared/image_helper/image_helper.dart';
import 'package:top_app/modules/submit_activity_proof/presentation/widgets/organisms/image_proof_section.dart';
import 'package:top_app/modules/submit_activity_proof/presentation/widgets/organisms/proof_template_section.dart';
import 'package:top_app/modules/submit_activity_proof/presentation/widgets/organisms/proof_submission_section.dart';

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
        if (state is Error && !state.isInformational) {
          CustomSnackBar.error(context, 'Ocurrió un error: ${state.message}. Intenta nuevamente.');
        } else if (state is Error && state.isInformational) {
          CustomSnackBar.info(context, state.message);
        } else if (state is ProofSubmitted) {
          if (state.isWithinTimeWindow) {
            CustomSnackBar.success(context, 'Proof submitted successfully');
          } else {
            CustomSnackBar.warning(
                context, 'Proof submitted outside of time window. Effort still counts though!');
          }
          Navigator.of(context).pop(true);
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
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ProofTemplateSection(proofTemplate: proofTemplate),
                          if (proofTemplate.type == ProofType.text ||
                              proofTemplate.type == ProofType.textAndImage)
                            const TextProofSection(),
                          const SizedBox(height: 20),
                          if (proofTemplate.type == ProofType.image ||
                              proofTemplate.type == ProofType.textAndImage)
                            ImageProofSection(
                              imageHelper: getIt<ImageHelper>(),
                            ),
                          const SizedBox(height: 80),
                        ],
                      ),
                    ),
                  ),
                ),
                const ProofSubmissionSection(),
              ],
            ),
          ),
        );
      },
    );
  }
}
