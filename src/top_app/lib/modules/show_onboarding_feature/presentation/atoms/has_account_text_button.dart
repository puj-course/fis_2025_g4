import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';

class HasAccountTextButton extends StatelessWidget {
  const HasAccountTextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        AutoRouter.of(context).push(const SignInRoute());
      },
      child: Text(
        'Already have an account? press here',
        style: AppTextStyles.regular14.copyWith(
          decoration: TextDecoration.underline,
          decorationColor: AppColors.whitePrimary,
        ),
      ),
    );
  }
}
