import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/modules/add_2fa/domain/cubit/add2_fa_cubit.dart';
import 'package:top_app/shared/widgets/buttons/white_filled_button.dart';
import 'package:top_app/shared/widgets/text_fields/gray_text_field.dart';

class NumberFieldSection extends StatefulWidget {
  const NumberFieldSection({
    super.key,
  });

  @override
  State<NumberFieldSection> createState() => _NumberFieldSectionState();
}

class _NumberFieldSectionState extends State<NumberFieldSection> {
  String _phoneNumber = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GrayTextField(
          label: 'Enter your phone number',
          keyboardType: TextInputType.phone,
          onChanged: (String value) {
            setState(() {
              _phoneNumber = value;
            });
          },
        ),
        const SizedBox(height: 24.0),
        WhiteFilledButton(
          text: 'Verify phone number',
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          onPressed: () {
            context.read<Add2FaCubit>().sendVerificationCode(_phoneNumber);
          },
        ),
      ],
    );
  }
}
