import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/core/theme/app_icon.dart';
import 'package:top_app/shared/global_state/user/domain/state_management/cubit/user_cubit.dart';

class NotificationBell extends StatelessWidget {
  const NotificationBell({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<UserCubit>().signOut();
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.blackTertiary, width: 1),
        ),
        child: Image.asset(
          AppIcon.bell.assetPath,
          width: 26,
          height: 26,
        ),
      ),
    );
  }
}
