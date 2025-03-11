import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/show_sign_up_freature/presentation/atoms/seconds_counter.dart';

class HeaderWithCounter extends StatelessWidget {
  const HeaderWithCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Create your account', style: AppTextStyles.bold22),
        Row(
          children: [
            Text(
              'It takes less than 1 minute: ',
              style: AppTextStyles.regular14.copyWith(color: AppColors.grayMidLight),
            ),
            SecondsCounter(initialSeconds: 60),
          ],
        ),
      ],
    );
  }
}
