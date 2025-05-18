import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';

class GrayTextField extends StatefulWidget {
  const GrayTextField({
    super.key,
    this.label,
    this.hint,
    this.controller,
    this.onChanged,
    this.onSubmitted,
    this.isEnabled = true,
    this.isObscured = false,
    this.validator,
    this.keyboardType,
    this.textCapitalization,
  });

  // Keyboard type and text capitalization
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;

  // Text related properties
  final String? label;
  final String? hint;

  // Controller and callbacks
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final String? Function(String?)? validator;

  // State properties
  final bool isEnabled;
  final bool isObscured;

  @override
  State<GrayTextField> createState() => _GrayTextFieldState();
}

class _GrayTextFieldState extends State<GrayTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.isObscured;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      enabled: widget.isEnabled,
      obscureText: _obscureText,
      validator: widget.validator,
      style: AppTextStyles.regular14,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      textCapitalization: widget.textCapitalization ?? TextCapitalization.none,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        labelText: widget.label,
        labelStyle: AppTextStyles.regular14.copyWith(color: AppColors.grayMidLight),
        hintText: widget.hint,
        hintStyle: AppTextStyles.regular14.copyWith(color: AppColors.grayMidLight),
        errorStyle: AppTextStyles.regular12.copyWith(color: Colors.red),
        filled: true,
        fillColor: AppColors.grayDark,
        // Add suffix icon for password fields
        suffixIcon: widget.isObscured
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: AppColors.grayMidLight,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
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
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: Colors.red, width: 1.5),
        ),
      ),
    );
  }
}
