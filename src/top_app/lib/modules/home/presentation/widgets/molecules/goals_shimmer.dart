import 'package:flutter/material.dart';
import 'package:top_app/shared/widgets/loaders/shimmer_container.dart';

class GoalsShimmer extends StatelessWidget {
  const GoalsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ShimmerContainer(width: double.infinity, height: 45),
        const SizedBox(height: 15),
        ShimmerContainer(width: double.infinity, height: 45),
        const SizedBox(height: 15),
        ShimmerContainer(width: double.infinity, height: 45),
      ],
    );
  }
}
