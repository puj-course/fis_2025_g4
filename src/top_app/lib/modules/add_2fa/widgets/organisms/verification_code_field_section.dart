import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/modules/add_2fa/domain/cubit/add2_fa_cubit.dart';
import 'package:top_app/shared/widgets/buttons/white_filled_button.dart';
import 'package:top_app/shared/widgets/text_fields/gray_text_field.dart';

class VerificationCodeFieldSection extends StatefulWidget {
  const VerificationCodeFieldSection({super.key});

  @override
  State<VerificationCodeFieldSection> createState() => _VerificationCodeFieldSectionState();
}

class _VerificationCodeFieldSectionState extends State<VerificationCodeFieldSection> {
  String _verificationCode = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GrayTextField(
          label: 'Enter the verification code',
          keyboardType: TextInputType.phone,
          onChanged: (String value) {
            setState(() {
              _verificationCode = value;
            });
          },
        ),
        const SizedBox(height: 24.0),
        WhiteFilledButton(
          text: 'Verify code',
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          onPressed: () {
            context.read<Add2FaCubit>().verifyPhoneNumber(_verificationCode);
          },
        ),
      ],
    );
  }
}
