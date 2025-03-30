import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:top_app/core/theme/app_colors.dart';

class ShimmerImage extends StatelessWidget {
  const ShimmerImage({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.shimmerBaseColor = AppColors.grayDark,
    this.shimmerHighlightColor = AppColors.grayMidDark,
    this.borderRadius,
  });

  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color shimmerBaseColor;
  final Color shimmerHighlightColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (width != null && height != null)
          Shimmer.fromColors(
            baseColor: shimmerBaseColor,
            highlightColor: shimmerHighlightColor,
            child: Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                color: shimmerBaseColor,
                borderRadius: borderRadius,
              ),
            ),
          ),
        ClipRRect(
          borderRadius: borderRadius ?? BorderRadius.zero,
          child: Image.network(
            imageUrl,
            width: width,
            height: height,
            fit: fit,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return Shimmer.fromColors(
                baseColor: shimmerBaseColor,
                highlightColor: shimmerHighlightColor,
                child: Container(
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: shimmerBaseColor,
                    borderRadius: borderRadius,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
