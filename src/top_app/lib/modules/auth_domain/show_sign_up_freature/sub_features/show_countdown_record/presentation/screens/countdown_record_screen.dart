import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:top_app/modules/auth_domain/show_sign_up_freature/sub_features/show_countdown_record/presentation/molecules/record_with_confetti.dart';
import 'package:top_app/modules/auth_domain/show_sign_up_freature/sub_features/show_countdown_record/presentation/molecules/congrats_texts.dart';
import 'package:top_app/modules/auth_domain/show_sign_up_freature/sub_features/show_countdown_record/presentation/atoms/bottom_navigation_button.dart';

@RoutePage()
class CountdownRecordScreen extends StatelessWidget {
  const CountdownRecordScreen({super.key, required this.remainingSeconds});

  final int remainingSeconds;

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
                const CongratsTexts(),
              ],
            ),
          ),
          BottomNavigationButton(
            buttonText: 'Start',
            onPressed: () {
              // Empty function for now
            },
          ),
        ],
      ),
    );
  }
}
