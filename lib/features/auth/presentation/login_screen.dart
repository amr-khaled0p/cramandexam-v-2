import 'package:cramandexam/core/theme/app_theme.dart';
import 'package:cramandexam/features/auth/presentation/register_screen.dart';
import 'package:cramandexam/features/home/presentation/home_page.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _rememberMe = false;
  bool _isLoading = false;
  bool _isPasswordObscured = true;
  String? _emailError;
  String? _passwordError;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeIn,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void _validateEmail(String value) {
    setState(() {
      if (value.isEmpty) {
        _emailError = 'يرجى إدخال البريد الإلكتروني';
      } else if (!RegExp(r'^\S+@\S+\.\S+$').hasMatch(value)) {
        _emailError = 'يرجى إدخال بريد إلكتروني صالح';
      } else {
        _emailError = null;
      }
    });
  }

  void _validatePassword(String value) {
    setState(() {
      if (value.isEmpty) {
        _passwordError = 'يرجى إدخال كلمة المرور';
      } else if (value.length < 6) {
        _passwordError = 'كلمة المرور يجب أن تكون 6 أحرف على الأقل';
      } else {
        _passwordError = null;
      }
    });
  }

  void _handleLogin() async {
    _validateEmail(emailController.text);
    _validatePassword(passwordController.text);

    if (_emailError == null && _passwordError == null) {
      setState(() {
        _isLoading = true;
      });

      // Simulate a network call
      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() {
          _isLoading = false;
        });

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                const Text('تم تسجيل الدخول بنجاح', textAlign: TextAlign.right),
            backgroundColor: AppTheme.secondaryColor,
            behavior: SnackBarBehavior.floating,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(10),
          ),
        );

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomePage()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppTheme.surfaceColor,
              AppTheme.backgroundColor,
            ],
          ),
        ),
        child: SafeArea(
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    // Logo
                    Container(
                      width: 100,
                      height: 100,
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
                            color: AppTheme.primaryColor.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                          BoxShadow(
                            color: AppTheme.secondaryColor.withOpacity(0.3),
                            blurRadius: 15,
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "CRAM",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "&",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "EXAM",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Header Text
                    const Text(
                      "مرحباً بعودتك",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 12),
                    const Text(
                      "سجل دخولك لمواصلة رحلة التفوق الطبي",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 50),

                    // Email Field
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: TextFormField(
                          controller: emailController,
                          textAlign: TextAlign.right,
                          keyboardType: TextInputType.emailAddress,
                          onChanged: _validateEmail,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "البريد الإلكتروني",
                            errorText: _emailError,
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            prefixIcon: const Icon(Icons.email_outlined,
                                color: AppTheme.primaryColor),
                            labelStyle: const TextStyle(color: Colors.white70),
                            errorStyle:
                                const TextStyle(color: Colors.redAccent),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Password Field
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 8,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: TextFormField(
                          controller: passwordController,
                          textAlign: TextAlign.right,
                          obscureText: _isPasswordObscured,
                          onChanged: _validatePassword,
                          style: const TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                            labelText: "كلمة المرور",
                            errorText: _passwordError,
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            prefixIcon: const Icon(Icons.lock_outline,
                                color: AppTheme.primaryColor),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordObscured
                                    ? Icons.visibility_off_outlined
                                    : Icons.visibility_outlined,
                                color: Colors.white70,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordObscured = !_isPasswordObscured;
                                });
                              },
                            ),
                            labelStyle: const TextStyle(color: Colors.white70),
                            errorStyle:
                                const TextStyle(color: Colors.redAccent),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Remember Me & Forgot Password
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            onPressed: () {
                              // Show password reset dialog
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: const Color(0xFF2A2A2A),
                                  title: const Text(
                                    "إعادة تعيين كلمة المرور",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  content: const TextField(
                                    textAlign: TextAlign.right,
                                    decoration: InputDecoration(
                                      hintText: "أدخل بريدك الإلكتروني",
                                      hintStyle:
                                          TextStyle(color: Colors.white54),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white30),
                                      ),
                                    ),
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text(
                                        "إلغاء",
                                        style: TextStyle(color: Colors.white70),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                              'تم إرسال رابط إعادة تعيين كلمة المرور إلى بريدك الإلكتروني',
                                              textAlign: TextAlign.right,
                                            ),
                                            backgroundColor:
                                                AppTheme.primaryColor,
                                          ),
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: AppTheme.primaryColor,
                                      ),
                                      child: const Text("إرسال"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: const Text(
                              "نسيت كلمة المرور؟",
                              style: TextStyle(
                                color: AppTheme.primaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const Text(
                                "تذكرني",
                                style: TextStyle(color: Colors.white70),
                              ),
                              Transform.scale(
                                scale: 0.9,
                                child: Checkbox(
                                  value: _rememberMe,
                                  onChanged: (value) {
                                    setState(() {
                                      _rememberMe = value!;
                                    });
                                  },
                                  fillColor:
                                      MaterialStateProperty.resolveWith<Color>(
                                    (Set<MaterialState> states) {
                                      if (states
                                          .contains(MaterialState.selected)) {
                                        return AppTheme.primaryColor;
                                      }
                                      return Colors.white54;
                                    },
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),

                    // Login Button
                    Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          colors: [
                            AppTheme.primaryColor,
                            Color(0xFF2980b9),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primaryColor.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _handleLogin,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: _isLoading
                            ? const SizedBox(
                                width: 24,
                                height: 24,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                  strokeWidth: 2,
                                ),
                              )
                            : const Text(
                                'تسجيل الدخول',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Register Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => RegisterScreen()),
                            );
                          },
                          child: const Text(
                            "إنشاء حساب",
                            style: TextStyle(
                              color: AppTheme.secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        const Text(
                          "ليس لديك حساب؟ ",
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
