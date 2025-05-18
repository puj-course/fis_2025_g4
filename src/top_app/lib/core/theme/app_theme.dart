// coverage:ignore-file
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppTheme {
  static ThemeData get darkTheme => ThemeData(
        fontFamily: 'Roboto',
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.white,
          selectionColor: Colors.white.withValues(alpha: 0.2),
        ),
        scaffoldBackgroundColor: AppColors.blackPrimary,
        brightness: Brightness.dark,
        splashColor: Colors.white,
        highlightColor: Colors.white.withValues(alpha: 0.5),
        colorScheme: ColorScheme.dark(
          primary: Colors.white,
          secondary: Colors.white,
        ),
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: Colors.white,
        ),
      );
}
