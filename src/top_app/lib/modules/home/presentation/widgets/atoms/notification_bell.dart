import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_app/core/theme/app_colors.dart';
import 'package:top_app/shared/global_state/user/domain/state_management/cubit/user_cubit.dart';

class NotificationBell extends StatelessWidget {
  const NotificationBell({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<UserCubit>().signOut();
      },
      child: SizedBox(
        width: 50,
        height: 50,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.blackTertiary, width: 1),
          ),
          alignment: Alignment.center,
          child: Icon(
            Icons.notifications_none,
            size: 25,
          ),
        ),
      ),
    );
  }
}
