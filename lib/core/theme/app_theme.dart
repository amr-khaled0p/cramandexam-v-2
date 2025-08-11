import 'package:flutter/material.dart';

class AppTheme {
  // App Colors
  static const Color primaryColor = Color(0xFF3498db);
  static const Color secondaryColor = Color(0xFF2ecc71);
  static const Color backgroundColor = Color(0xFF121212);
  static const Color surfaceColor = Color(0xFF1E1E1E);
  static const Color errorColor = Color(0xFFe74c3c);
  static const Color warningColor = Color(0xFFf39c12);
  static const Color purpleColor = Color(0xFF9b59b6);

  // Dark Theme
  static final ThemeData darkTheme = ThemeData.dark().copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: backgroundColor,
    colorScheme: const ColorScheme.dark(
      primary: primaryColor,
      secondary: secondaryColor,
      surface: surfaceColor,
      background: backgroundColor,
    ),
    // --- التغيير هنا ---
    cardTheme: CardThemeData(
      // تم التغيير من CardTheme إلى CardThemeData
      color: surfaceColor,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: surfaceColor,
      elevation: 0,
    ),
    textTheme: const TextTheme(
      headlineMedium: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Tajawal',
      ),
      titleLarge: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: 'Tajawal',
      ),
      bodyLarge: TextStyle(color: Colors.white70, fontFamily: 'Tajawal'),
      bodyMedium: TextStyle(color: Colors.white70, fontFamily: 'Tajawal'),
    ).apply(
      fontFamily: 'Tajawal', // Set default font family for all text styles
    ),
  );
}
