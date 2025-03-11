import 'package:flutter/material.dart';
import 'package:top_app/modules/show_sign_up_freature/presentation/molecules/text_field_with_label.dart';
import 'package:top_app/shared/utils/validators/name_validator.dart';
import 'package:top_app/shared/widgets/buttons/underlined_text_button.dart';
import 'package:top_app/shared/widgets/snackbars/custom_snackbar.dart';

class NameQuestion extends StatefulWidget {
  const NameQuestion({super.key});

  @override
  State<NameQuestion> createState() => _NameQuestionState();
}

class _NameQuestionState extends State<NameQuestion> {
  final TextEditingController _nameController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
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
              label: 'Name',
              hint: 'Enter your full name',
              controller: _nameController,
              validator: NameValidator.validate,
            ),
            const SizedBox(height: 20),
            UnderlinedTextButton(
              text: 'Why do we ask this information?',
              onPressed: () {
                // Show information dialog or tooltip
                CustomSnackBar.info(
                  context,
                  'We use your name to personalize your experience',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
