import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/modules/auth_domain/show_sign_up_freature/presentation/molecules/text_field_with_label.dart';
import 'package:top_app/shared/utils/validators/email_validator.dart';
import 'package:top_app/shared/widgets/buttons/underlined_text_button.dart';
import 'package:top_app/shared/widgets/snackbars/custom_snackbar.dart';

import '../../domain/cubit/sign_up_cubit.dart';

class EmailQuestion extends StatefulWidget {
  const EmailQuestion({super.key});

  @override
  State<EmailQuestion> createState() => EmailQuestionState();
}

// Make the state class public so it can be accessed from outside
class EmailQuestionState extends State<EmailQuestion> {
  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Add a method to get the email value
  String getEmail() {
    return _emailController.text;
  }

  // Add a validate method that returns true if the form is valid
  bool validate() {
    return _formKey.currentState?.validate() ?? false;
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _emailController.text = context.read<SignUpCubit>().email;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TextFieldWithLabel(
              label: 'Email',
              hint: 'Enter your main email address',
              controller: _emailController,
              validator: EmailValidator.validate,
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 20),
            UnderlinedTextButton(
              text: 'Why do we ask this information?',
              onPressed: () {
                // Show information dialog or tooltip
                CustomSnackBar.info(
                  context,
                  'We use your email to verify your account in case of lost password or other issues',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
