import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/shared/widgets/text_fields/gray_text_field.dart';

class TextFieldWithLabel extends StatelessWidget {
  const TextFieldWithLabel(
      {super.key,
      required this.label,
      required this.hint,
      required this.controller,
      this.onChanged,
      this.onSubmitted,
      this.validator});

  final String label;
  final String hint;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.bold18),
        const SizedBox(height: 12),
        GrayTextField(
          hint: hint,
          controller: controller,
          onChanged: onChanged,
          onSubmitted: onSubmitted,
          validator: validator,
        ),
      ],
    );
  }
}
