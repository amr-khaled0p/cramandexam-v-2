import 'package:flutter/material.dart';
import 'package:cramandexam/core/theme/app_theme.dart';
import 'package:cramandexam/features/splash/presentation/splash_screen.dart';

void main() {
  runApp(const CramAndExamApp());
}

class CramAndExamApp extends StatelessWidget {
  const CramAndExamApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CRAM & EXAM',
      theme: AppTheme.darkTheme,
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
