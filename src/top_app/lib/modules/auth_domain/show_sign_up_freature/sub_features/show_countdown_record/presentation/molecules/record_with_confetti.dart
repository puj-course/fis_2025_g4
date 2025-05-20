import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:confetti/confetti.dart';
import 'dart:math';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';

class RecordWithConfetti extends StatefulWidget {
  const RecordWithConfetti({
    super.key,
    required this.seconds,
  });

  final int seconds;

  @override
  State<RecordWithConfetti> createState() => _RecordWithConfettiState();
}

class _RecordWithConfettiState extends State<RecordWithConfetti> {
  late ConfettiController _confettiController;

  @override
  void initState() {
    super.initState();
    _confettiController = ConfettiController(duration: const Duration(seconds: 5));
    // Start the confetti animation when the widget loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _confettiController.play();
      HapticFeedback.vibrate();
    });
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        // Position the confetti controller at the number
        Positioned(
          child: ConfettiWidget(
            confettiController: _confettiController,
            blastDirection: -pi / 2,
            emissionFrequency: 0.05,
            numberOfParticles: 20,
            maxBlastForce: 20,
            minBlastForce: 10,
            gravity: 0.1, // Slower falling confetti
            shouldLoop: false,
            colors: const <Color>[
              AppColors.whitePrimary,
            ],
          ),
        ),
        Text(
          '${widget.seconds.toString()}s',
          style: AppTextStyles.bold22.copyWith(fontSize: 100),
        ),
      ],
    );
  }
}
