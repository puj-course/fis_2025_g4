import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class DelayedFadeIn extends StatefulWidget {
  final Widget child;
  final Duration delay;
  final Duration duration;
  final Curve curve;

  const DelayedFadeIn({
    super.key,
    required this.child,
    this.delay = const Duration(milliseconds: 300),
    this.duration = const Duration(milliseconds: 800),
    this.curve = Curves.easeInOut,
  });

  @override
  State<DelayedFadeIn> createState() => _DelayedFadeInState();
}

class _DelayedFadeInState extends State<DelayedFadeIn> {
  bool _shouldShow = false;

  @override
  void initState() {
    super.initState();
    _startDelayedFadeIn();
  }

  void _startDelayedFadeIn() async {
    await Future.delayed(widget.delay);
    if (mounted) {
      setState(() {
        _shouldShow = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_shouldShow) {
      return const SizedBox.shrink();
    }

    return FadeIn(
      duration: widget.duration,
      curve: widget.curve,
      child: widget.child,
    );
  }
}
