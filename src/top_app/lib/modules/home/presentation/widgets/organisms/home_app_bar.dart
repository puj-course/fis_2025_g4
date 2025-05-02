import 'package:flutter/material.dart';
import 'package:top_app/core/theme/app_texts_styles.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/modules/home/presentation/widgets/atoms/greeting_text.dart';
import 'package:top_app/modules/home/presentation/widgets/atoms/notification_bell.dart';
import 'package:top_app/shared/loaders/shimmer_image.dart';
import 'package:top_app/shared/global_state/user/domain/entity/user_entity.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({
    super.key,
    required this.user,
  });

  final UserEntity user;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.blackPrimary,
      elevation: 0,
      bottom: PreferredSize(
        preferredSize: const Size.fromHeight(1),
        child: Container(
          color: AppColors.grayDark,
          height: 1,
        ),
      ),
      title: Row(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: ShimmerImage(
              imageUrl: user.profilePictureUrl,
              width: 45,
              height: 45,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const GreetingText(),
                Text(
                  user.name,
                  style: AppTextStyles.bold18,
                ),
              ],
            ),
          ),
          const SizedBox(
            width: 35,
            height: 35,
            child: NotificationBell(),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
