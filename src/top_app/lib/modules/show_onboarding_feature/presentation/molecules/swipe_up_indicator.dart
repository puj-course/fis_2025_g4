import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/shared/widgets/animations/delayed_fade_in.dart';

class SwipeUpIndicator extends StatefulWidget {
  final String customText;
  final Duration delay;
  const SwipeUpIndicator({super.key, this.customText = 'Swipe up to start', required this.delay});

  @override
  State<SwipeUpIndicator> createState() => _SwipeUpIndicatorState();
}

class _SwipeUpIndicatorState extends State<SwipeUpIndicator> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<Offset>(
      begin: const Offset(0, 0),
      end: const Offset(0, -0.5),
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DelayedFadeIn(
      delay: widget.delay,
      child: SlideTransition(
        position: _animation,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const Icon(
              CupertinoIcons.chevron_up,
              color: Colors.white,
              size: 24,
            ),
            const SizedBox(height: 8),
            Text(
              widget.customText,
              style: AppTextStyles.regular12,
            ),
          ],
        ),
      ),
    );
  }
}
