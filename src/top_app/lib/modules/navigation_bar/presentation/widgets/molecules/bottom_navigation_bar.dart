import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/modules/navigation_bar/presentation/widgets/atoms/navigation_item.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.blackPrimary,
        border: Border(
          top: BorderSide(
            color: AppColors.grayDark,
            width: 1,
          ),
        ),
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            NavigationItem(
              icon: Icons.home,
              label: 'Home',
              isSelected: currentIndex == 0,
              onTap: () => onTap(0),
            ),
            NavigationItem(
              icon: Icons.emoji_events,
              label: 'Challenges',
              isSelected: currentIndex == 1,
              onTap: () => onTap(1),
            ),
            NavigationItem(
              icon: Icons.people,
              label: 'Tribe',
              isSelected: currentIndex == 2,
              onTap: () => onTap(2),
            ),
            NavigationItem(
              icon: Icons.person,
              label: 'Profile',
              isSelected: currentIndex == 3,
              onTap: () => onTap(3),
            ),
          ],
        ),
      ),
    );
  }
}
