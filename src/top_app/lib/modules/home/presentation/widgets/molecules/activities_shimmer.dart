import 'package:flutter/material.dart';
import 'package:top_app/shared/widgets/loaders/shimmer_container.dart';

class ActivitiesShimmer extends StatelessWidget {
  const ActivitiesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ShimmerContainer(width: double.infinity, height: 80),
        const SizedBox(height: 15),
        ShimmerContainer(width: double.infinity, height: 80),
        const SizedBox(height: 15),
        ShimmerContainer(width: double.infinity, height: 80),
      ],
    );
  }
}
