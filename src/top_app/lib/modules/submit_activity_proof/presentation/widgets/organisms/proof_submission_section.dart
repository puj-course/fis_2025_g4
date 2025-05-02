import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/modules/submit_activity_proof/presentation/state_management/cubit/submit_activity_proof_cubit.dart';
import 'package:top_app/shared/widgets/buttons/white_filled_button.dart';

class ProofSubmissionSection extends StatelessWidget {
  const ProofSubmissionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SubmitActivityProofCubit, SubmitActivityProofState>(
      builder: (BuildContext context, SubmitActivityProofState state) {
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.1),
                blurRadius: 4,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: WhiteFilledButton(
            text: 'Submit Proof',
            onPressed: () async {
              await context.read<SubmitActivityProofCubit>().submitProof();
            },
            isLoading: state is SubmittingProof,
            isDone: state is ProofSubmitted,
          ),
        );
      },
    );
  }
}
