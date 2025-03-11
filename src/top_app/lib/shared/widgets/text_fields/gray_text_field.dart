import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GrayTextField extends StatelessWidget {
  const GrayTextField({
    super.key,
    required this.label,
    required this.hint,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.isEnabled = true,
    this.isObscured = false,
    this.validator,
    this.suffixEmoji,
  });

  // Text related properties
  final String label;
  final String hint;

  // Controller and callbacks
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final String? Function(String?)? validator;

  // Optional suffix emoji SVG
  final String? suffixEmoji;

  // State properties
  final bool isEnabled;
  final bool isObscured;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: onChanged,
      onFieldSubmitted: onSubmitted,
      enabled: isEnabled,
      obscureText: isObscured,
      validator: validator,
      style: AppTextStyles.regular14,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        labelText: label,
        labelStyle: AppTextStyles.regular14.copyWith(color: AppColors.grayMidLight),
        hintText: hint,
        hintStyle: AppTextStyles.regular14.copyWith(color: AppColors.grayMidLight),
        filled: true,
        fillColor: AppColors.grayDark,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: AppColors.grayMidDark, width: 1),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 1),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        suffixIcon: suffixEmoji != null
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child: SvgPicture.asset(
                  suffixEmoji!,
                  width: 20,
                  height: 20,
                ),
              )
            : null,
      ),
    );
  }
}
