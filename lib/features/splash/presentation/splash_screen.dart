import 'dart:async';
import 'package:cramandexam/core/theme/app_theme.dart';
import 'package:cramandexam/features/auth/presentation/login_screen.dart'; // مسار مطلق مؤقت، سيتم نقله لاحقًا
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Animation<double> _fadeAnimation;
  late final Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _scaleAnimation = Tween<double>(begin: 0.5, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.easeOutBack,
      ),
    );

    _animationController.forward();

    // TODO: سيتم نقل هذا المنطق إلى طبقة الـ BLoC/Cubit لاحقًا
    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // بناء الواجهة يجب أن يكون وظيفته العرض فقط
    return Scaffold(
      backgroundColor: AppTheme.backgroundColor,
      body: Center(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildLogo(),
                const SizedBox(height: 30),
                const Text(
                  "دكتورنا الغالي",
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white70,
                    letterSpacing: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "طريقك للتفوق",
                  style: TextStyle(
                    fontSize: 18,
                    color: AppTheme.secondaryColor,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // فصل اللوجو في ودجت بناء خاصة به لتنظيم الكود
  Widget _buildLogo() {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: const RadialGradient(
          colors: [
            AppTheme.primaryColor,
            AppTheme.secondaryColor,
          ],
          center: Alignment.center,
          radius: 0.8,
        ),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primaryColor.withOpacity(0.5),
            blurRadius: 20,
            spreadRadius: 5,
          ),
        ],
      ),
      child: const Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            // استخدام Text ودجات واحدة بقدر الإمكان
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "CRAM",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                    shadows: [
                      Shadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          blurRadius: 4)
                    ],
                  ),
                ),
                Text(
                  "&",
                  style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  "EXAM",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 2,
                    shadows: [
                      Shadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          blurRadius: 4)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
