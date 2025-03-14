import 'package:flutter/material.dart';
import 'package:top_app/shared/widgets/buttons/white_filled_button.dart';

class SignInBottomNavigation extends StatelessWidget {
  const SignInBottomNavigation({
    super.key,
    required this.onSignIn,
  });

  final VoidCallback onSignIn;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: const BoxDecoration(
          color: Colors.black,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, -2),
            ),
          ],
        ),
        child: SizedBox(
          width: double.infinity,
          child: WhiteFilledButton(
            text: 'Log In',
            onPressed: onSignIn,
          ),
        ),
      ),
    );
  }
}
