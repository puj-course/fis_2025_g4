import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_app/shared/widgets/buttons/white_filled_button.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          //TODO: Title & counter header
          //TODO: Here the pageview
          //TODO: Here the dot inticator
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
