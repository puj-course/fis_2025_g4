import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/di/injector.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/modules/submit_activity_proof/presentation/state_management/cubit/submit_activity_proof_cubit.dart';
import 'package:top_app/shared/entities/templates/activity.dart';
import 'package:top_app/shared/entities/templates/proof.dart';
import 'package:top_app/shared/loaders/centered_loader.dart';
import 'package:top_app/shared/widgets/buttons/white_filled_button.dart';
import 'package:top_app/shared/widgets/snackbars/custom_snackbar.dart';
import 'package:top_app/shared/widgets/tiles/proof_tile.dart';

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

class SubmitActivityProofScreenBody extends StatefulWidget {
  const SubmitActivityProofScreenBody({super.key});

  @override
  State<SubmitActivityProofScreenBody> createState() => _SubmitActivityProofScreenBodyState();
}

class _SubmitActivityProofScreenBodyState extends State<SubmitActivityProofScreenBody> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textController = TextEditingController();
  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

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

        final Proof proofTemplate = context.read<SubmitActivityProofCubit>().proofTemplate;

        return Scaffold(
          appBar: AppBar(
            title: Text('Complete the activity', style: AppTextStyles.bold18),
          ),
          body: SafeArea(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Required Proof', style: AppTextStyles.bold16),
                      ProofTile(name: proofTemplate.name, icon: proofTemplate.icon),
                      Text('Your submission', style: AppTextStyles.bold16),
                      const SizedBox(height: 10),
                      if (proofTemplate.type == ProofType.text)
                        Container(
                          decoration: BoxDecoration(
                            border: Border(
                              left: BorderSide(
                                color: (_focusNode.hasFocus || _textController.text.isNotEmpty)
                                    ? AppColors.grayLight
                                    : AppColors.grayMidDark,
                                width: 4,
                              ),
                            ),
                          ),
                          child: TextFormField(
                            focusNode: _focusNode,
                            controller: _textController,
                            onTapOutside: (PointerDownEvent value) {
                              _focusNode.unfocus();
                              setState(() {});
                            },
                            onTap: () {
                              setState(() {});
                            },
                            onEditingComplete: () {
                              context
                                  .read<SubmitActivityProofCubit>()
                                  .updateProofText(_textController.text);
                            },
                            maxLines: null,
                            textAlignVertical: TextAlignVertical.top,
                            style: AppTextStyles.regular14,
                            decoration: InputDecoration(
                              hintText: 'Enter your proof',
                              hintStyle:
                                  AppTextStyles.regular14.copyWith(color: AppColors.grayNeutral),
                              contentPadding:
                                  const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
                              border: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width - 32,
                    child: WhiteFilledButton(
                      text: 'Submit Proof',
                      onPressed: () {
                        context
                            .read<SubmitActivityProofCubit>()
                            .updateProofText(_textController.text);
                        context.read<SubmitActivityProofCubit>().submitProof();
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
