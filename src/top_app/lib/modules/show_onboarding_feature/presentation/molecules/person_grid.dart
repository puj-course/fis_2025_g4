import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_app/shared/widgets/animations/delayed_fade_in.dart';

enum PersonGridMode { sequentialFadeIn, highlightOne }

class PersonGrid extends StatelessWidget {
  final PersonGridMode mode;
  final int highlightIndex;

  const PersonGrid({
    super.key,
    this.mode = PersonGridMode.sequentialFadeIn,
    this.highlightIndex = 12, // Default to middle position (5 columns x 6 rows / 2)
  });

  @override
  Widget build(BuildContext context) {
    // Grid configuration: 5 columns, 6 rows
    const int columns = 5;
    const int rows = 6;
    const int totalIcons = columns * rows;

    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: totalIcons,
      itemBuilder: (BuildContext context, int index) {
        switch (mode) {
          case PersonGridMode.sequentialFadeIn:
            return _buildSequentialFadeInItem(index);
          case PersonGridMode.highlightOne:
            return _buildHighlightOneItem(index);
        }
      },
    );
  }

  Widget _buildSequentialFadeInItem(int index) {
    // Calculate delay based on index (left to right, top to bottom)
    final Duration delay = Duration(milliseconds: 100 * index);

    return DelayedFadeIn(
      delay: delay,
      child: SvgPicture.asset(
        'assets/icons/person_icon.svg',
        width: 20,
        height: 20,
      ),
    );
  }

  Widget _buildHighlightOneItem(int index) {
    // All items fade in together, but only one stays as the normal icon
    return DelayedFadeIn(
      delay: const Duration(milliseconds: 500), // All fade in at the same time
      child: SvgPicture.asset(
        index == highlightIndex
            ? 'assets/icons/person_icon.svg'
            : 'assets/icons/person_obscured_icon.svg',
        width: 20,
        height: 20,
      ),
    );
  }
}
