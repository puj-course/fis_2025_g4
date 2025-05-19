import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:top_app/core/theme/app_colors.dart';

class ShimmerImage extends StatelessWidget {
  const ShimmerImage({
    super.key,
    this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.shimmerBaseColor = AppColors.grayDark,
    this.shimmerHighlightColor = AppColors.grayMidDark,
    this.borderRadius,
  });

  final String? imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final Color shimmerBaseColor;
  final Color shimmerHighlightColor;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
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
          child: imageUrl != null && imageUrl!.isNotEmpty
              ? Image.network(
                  imageUrl!,
                  width: width,
                  height: height,
                  fit: fit,
                  loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
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
                )
              : Image.asset(
                  'assets/images/default_profile_pic.png',
                  width: width,
                  height: height,
                  fit: fit,
                ),
        ),
      ],
    );
  }
}
