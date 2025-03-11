import 'package:flutter/material.dart';
import 'dart:async';
import '../../../../core/theme/app_texts_styles.dart';

class SecondsCounter extends StatefulWidget {
  final int initialSeconds;
  final VoidCallback? onFinished;

  const SecondsCounter({
    super.key,
    required this.initialSeconds,
    this.onFinished,
  });

  @override
  State<SecondsCounter> createState() => _SecondsCounterState();
}

class _SecondsCounterState extends State<SecondsCounter> {
  late int _secondsRemaining;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _secondsRemaining = widget.initialSeconds;
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_secondsRemaining > 0) {
          _secondsRemaining--;
        } else {
          _timer?.cancel();
          if (widget.onFinished != null) {
            widget.onFinished!();
          }
        }
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${_secondsRemaining}s',
      style: AppTextStyles.bold14,
    );
  }
}
