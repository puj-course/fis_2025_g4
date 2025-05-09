import 'package:flutter/material.dart';
import 'package:top_app/shared/widgets/loaders/shimmer_container.dart';

class CompetitorsGridShimmer extends StatelessWidget {
  const CompetitorsGridShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisExtent: 110,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      children: <Widget>[
        _buildShimmerContainer(),
        _buildShimmerContainer(),
        _buildShimmerContainer(),
        _buildShimmerContainer(),
      ],
    );
  }

  Widget _buildShimmerContainer() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ShimmerContainer(
          width: 60,
          height: 60,
          isCircle: true,
        ),
        Spacer()
      ],
    );
  }
}
