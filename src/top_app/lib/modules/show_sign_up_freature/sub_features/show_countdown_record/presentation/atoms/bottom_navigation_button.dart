import 'package:flutter/material.dart';
import 'package:top_app/shared/widgets/buttons/white_filled_button.dart';

class BottomNavigationButton extends StatelessWidget {
  const BottomNavigationButton({
    super.key,
    required this.onPressed,
    required this.buttonText,
  });

  final VoidCallback onPressed;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: WhiteFilledButton(
            text: buttonText,
            onPressed: onPressed,
          ),
        ),
      ),
    );
  }
}
