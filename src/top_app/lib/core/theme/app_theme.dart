import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme => ThemeData(
        fontFamily: 'Roboto',
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionColor: Colors.white,
        ),
        scaffoldBackgroundColor: AppColors.blackPrimary,
        brightness: Brightness.dark,
      );
}
