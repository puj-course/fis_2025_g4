import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/shared/utils/validators/name_validator.dart';
import 'package:top_app/shared/widgets/buttons/underlined_text_button.dart';
import 'package:top_app/shared/widgets/snackbars/custom_snackbar.dart';

import '../../domain/cubit/sign_up_cubit.dart';
import '../molecules/text_field_with_label.dart';

class NameQuestion extends StatefulWidget {
  const NameQuestion({super.key});

  @override
  State<NameQuestion> createState() => NameQuestionState();
}

// Make the state class public so it can be accessed from outside
class NameQuestionState extends State<NameQuestion> {
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Add a method to get the name value
  String getName() {
    return _nameController.text;
  }

  // Add a validate method that returns true if the form is valid
  bool validate() {
    return _formKey.currentState?.validate() ?? false;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _nameController.text = context.read<SignUpCubit>().name;
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
              label: 'Name',
              hint: 'Enter your full name',
              controller: _nameController,
              validator: NameValidator.validate,
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 20),
            UnderlinedTextButton(
              text: 'Why do we ask this information?',
              onPressed: () {
                // Show information dialog or tooltip
                CustomSnackBar.info(
                  context,
                  'We use your name to identify you in the app between other users',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
