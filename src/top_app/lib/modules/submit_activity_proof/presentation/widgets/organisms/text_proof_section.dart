import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/submit_activity_proof/presentation/state_management/cubit/submit_activity_proof_cubit.dart';

class TextProofSection extends StatefulWidget {
  const TextProofSection({super.key});

  @override
  State<TextProofSection> createState() => _TextProofSectionState();
}

class _TextProofSectionState extends State<TextProofSection> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _textController = TextEditingController();

  @override
  void dispose() {
    _focusNode.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
          context.read<SubmitActivityProofCubit>().updateProofText(_textController.text);
        },
        maxLines: null,
        textAlignVertical: TextAlignVertical.top,
        style: AppTextStyles.regular14,
        textInputAction: TextInputAction.newline,
        keyboardType: TextInputType.multiline,
        onChanged: (String text) {
          context.read<SubmitActivityProofCubit>().updateProofText(text);
        },
        textCapitalization: TextCapitalization.sentences,
        decoration: InputDecoration(
          hintText: 'Enter your proof',
          hintStyle: AppTextStyles.regular14.copyWith(color: AppColors.grayNeutral),
          contentPadding: const EdgeInsets.only(left: 16, right: 16, top: 12, bottom: 12),
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
        ),
      ),
    );
  }
}
