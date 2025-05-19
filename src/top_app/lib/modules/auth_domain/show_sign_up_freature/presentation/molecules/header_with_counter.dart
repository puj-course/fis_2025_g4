import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/modules/auth_domain/show_sign_up_freature/presentation/atoms/seconds_counter.dart';

class HeaderWithCounter extends StatelessWidget {
  const HeaderWithCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: <Widget>[
          Text('Create your account', style: AppTextStyles.bold22),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'It takes less than 1 minute: ',
                style: AppTextStyles.regular14.copyWith(color: AppColors.grayMidLight),
              ),
              const SecondsCounter(initialSeconds: 60),
            ],
          ),
        ],
      ),
    );
  }
}
