import 'package:flutter/material.dart';

class AppTheme {
  static const Color primary = Color(0xFF7657F6);
  static const Color background = Color(0xFFF6F5FC);
  static const Color card = Colors.white;
  static const Color textPrimary = Color(0xFF202033);
  static const Color textSecondary = Color(0xFF85859A);
  static const Color success = Color(0xFF27C995);
  static const Color danger = Color(0xFFFF647C);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: background,
    colorScheme: ColorScheme.fromSeed(
      seedColor: primary,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: background,
      foregroundColor: textPrimary,
      elevation: 0,
      centerTitle: false,
    ),
    cardTheme: CardThemeData(
      color: card,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
    ),
  );
}
