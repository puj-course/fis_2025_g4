import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_app/shared/widgets/buttons/white_filled_button.dart';
import 'package:top_app/shared/widgets/text_fields/gray_text_field.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          //TODO: Add titile & counter header
          Column(children: [
            GrayTextField(
                label: 'Name',
                hint: 'Enter your name here',
                suffixEmoji: 'assets/emojis/silhouette.svg',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                }),
          ]),
          //TODO: Add dot indicators
          //TODO: Add bottom button
          Positioned(
            bottom: 0,
            left: 10,
            right: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: WhiteFilledButton(text: 'Continue', onPressed: () {}),
            ),
          )
        ]),
      ),
    );
  }
}
