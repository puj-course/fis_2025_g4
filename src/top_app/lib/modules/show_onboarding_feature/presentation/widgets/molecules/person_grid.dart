import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:top_app/shared/widgets/delayed_fade_in.dart';

class PersonGrid extends StatelessWidget {
  const PersonGrid({super.key});

  @override
  Widget build(BuildContext context) {
    // Grid configuration: 5 columns, 7 rows
    const int columns = 5;
    const int rows = 6;
    const int totalIcons = columns * rows;

    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: columns,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: totalIcons,
      itemBuilder: (context, index) {
        // Calculate delay based on index (left to right, top to bottom)
        final delay = Duration(milliseconds: 100 * index);

        return DelayedFadeIn(
          delay: delay,
          child: SvgPicture.asset(
            'assets/icons/person_icon.svg',
            width: 20,
            height: 20,
          ),
        );
      },
    );
  }
}
