import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:top_app/core/theme/app_colors.dart';

class CustomDotPageIndicator extends StatefulWidget {
  const CustomDotPageIndicator({super.key, required this.controller, required this.count});

  final PageController controller;
  final int count;

  @override
  State<CustomDotPageIndicator> createState() => _CustomDotPageIndicatorState();
}

class _CustomDotPageIndicatorState extends State<CustomDotPageIndicator> {
  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: widget.controller,
      count: widget.count,
      effect: const SlideEffect(
        dotWidth: 10,
        dotHeight: 10,
        dotColor: AppColors.grayDark,
        activeDotColor: AppColors.whitePrimary,
      ),
    );
  }
}
