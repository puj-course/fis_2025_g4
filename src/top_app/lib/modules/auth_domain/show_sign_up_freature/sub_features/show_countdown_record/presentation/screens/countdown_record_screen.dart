import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:top_app/core/router/app_router.dart';
import 'package:top_app/modules/auth_domain/show_sign_up_freature/sub_features/show_countdown_record/presentation/molecules/record_with_confetti.dart';
import 'package:top_app/modules/auth_domain/show_sign_up_freature/sub_features/show_countdown_record/presentation/molecules/congrats_texts.dart';
import 'package:top_app/modules/auth_domain/show_sign_up_freature/sub_features/show_countdown_record/presentation/atoms/bottom_navigation_button.dart';

@RoutePage()
class CountdownRecordScreen extends StatelessWidget {
  const CountdownRecordScreen({super.key, required this.remainingSeconds, required this.rank});

  final int remainingSeconds;
  final int rank;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RecordWithConfetti(seconds: remainingSeconds),
                CongratsTexts(rank: rank),
              ],
            ),
          ),
          BottomNavigationButton(
            buttonText: 'Start',
            onPressed: () {
              AutoRouter.of(context).replace(const HomeRoute());
            },
          ),
        ],
      ),
    );
  }
}
