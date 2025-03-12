import 'package:flutter/material.dart';
import 'package:top_app/modules/show_sign_up_freature/presentation/molecules/text_field_with_label.dart';
import 'package:top_app/shared/utils/validators/password_validator.dart';
import 'package:top_app/shared/widgets/buttons/underlined_text_button.dart';
import 'package:top_app/shared/widgets/snackbars/custom_snackbar.dart';

class PasswordQuestion extends StatefulWidget {
  const PasswordQuestion({super.key});

  @override
  State<PasswordQuestion> createState() => PasswordQuestionState();
}

// Make the state class public so it can be accessed from outside
class PasswordQuestionState extends State<PasswordQuestion> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Add a validate method that returns true if the form is valid
  bool validate() {
    return _formKey.currentState?.validate() ?? false;
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFieldWithLabel(
              label: 'Password',
              hint: 'Create a secure password',
              controller: _passwordController,
              validator: PasswordValidator.validate,
              obscure: true,
            ),
            const SizedBox(height: 20),
            TextFieldWithLabel(
              label: 'Confirm Password',
              hint: 'Confirm your password',
              controller: _confirmPasswordController,
              validator: (value) => PasswordValidator.validateConfirmation(
                value,
                _passwordController.text,
              ),
              obscure: true,
            ),
            const SizedBox(height: 20),
            UnderlinedTextButton(
              text: 'Why do we ask this information?',
              onPressed: () {
                // Show information dialog or tooltip
                CustomSnackBar.info(
                  context,
                  'A strong password helps keep your account secure',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
