import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: <Widget>[
          Text('Enter your account', style: AppTextStyles.bold22),
          const SizedBox(height: 5),
          Text(
            'Sign in to continue',
            style: AppTextStyles.regular14.copyWith(color: AppColors.grayMidLight),
          ),
        ],
      ),
    );
  }
}
