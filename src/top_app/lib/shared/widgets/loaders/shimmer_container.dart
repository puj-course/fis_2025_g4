import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:top_app/core/theme/app_colors.dart';

class ShimmerContainer extends StatelessWidget {
  final double width;
  final double height;

  // Optional colors
  final Color? baseColor;
  final Color? highlightColor;

  // Optional shape
  final bool isCircle;

  const ShimmerContainer({
    super.key,
    required this.width,
    required this.height,
    this.baseColor,
    this.highlightColor,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor ?? AppColors.blackTertiary,
      highlightColor: highlightColor ?? AppColors.grayDark,
      direction: ShimmerDirection.ltr,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColors.grayMidDark,
          borderRadius: isCircle ? BorderRadius.circular(width / 2) : BorderRadius.circular(10),
        ),
      ),
    );
  }
}
