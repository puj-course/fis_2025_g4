import 'package:flutter/material.dart';
import 'package:top_app/shared/widgets/buttons/white_filled_button.dart';

class SignInBottomNavigation extends StatelessWidget {
  const SignInBottomNavigation({
    super.key,
    required this.onSignIn,
    required this.isLoading,
  });

  final VoidCallback onSignIn;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SizedBox(
        width: double.infinity,
        child: WhiteFilledButton(
          text: 'Log In',
          isLoading: isLoading,
          onPressed: onSignIn,
        ),
      ),
    );
  }
}
