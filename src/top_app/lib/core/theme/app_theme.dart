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
        highlightColor: Colors.white,
        splashColor: Colors.white,
        colorScheme: ColorScheme.dark(
          primary: Colors.white,
          secondary: Colors.white,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.white,
        ),
      );
}
