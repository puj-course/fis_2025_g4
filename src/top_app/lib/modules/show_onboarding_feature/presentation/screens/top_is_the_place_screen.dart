import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/shared/widgets/animations/delayed_fade_in.dart';
import 'package:typewritertext/typewritertext.dart';

@RoutePage()
class TopIsThePlaceScreen extends StatelessWidget {
  const TopIsThePlaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TypeWriter.text(
                'This is the right place',
                style: AppTextStyles.regular16,
                duration: const Duration(milliseconds: 100),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 50),
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).replace(const SignUpRoute());
                },
                child: DelayedFadeIn(
                  delay: const Duration(milliseconds: 23 * 120),
                  duration: const Duration(seconds: 1),
                  child: SvgPicture.asset(
                    'assets/icons/top_icon.svg',
                    width: 200,
                    height: 200,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              DelayedFadeIn(
                delay: const Duration(milliseconds: 23 * 120 + 2000),
                child: TypeWriter.text(
                  'Press the icon to be part of the 1%',
                  style: AppTextStyles.regular14.copyWith(color: AppColors.grayNeutral),
                  duration: const Duration(milliseconds: 100),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
