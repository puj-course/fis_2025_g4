import 'package:flutter/material.dart';
import 'package:top_app/shared/widgets/loaders/shimmer_container.dart';

class AppBarShimmer extends StatelessWidget {
  const AppBarShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: <Widget>[
            Row(
              children: <Widget>[
                ShimmerContainer(width: 50, height: 50, isCircle: true),
                const SizedBox(width: 16),
                ShimmerContainer(width: 150, height: 35),
              ],
            ),
            const Spacer(),
            ShimmerContainer(width: 40, height: 40),
          ],
        ),
      ),
    );
  }
}
