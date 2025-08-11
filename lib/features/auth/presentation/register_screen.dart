import 'package:cramandexam/core/theme/app_theme.dart';
import 'package:cramandexam/features/auth/presentation/login_screen.dart';
import 'package:cramandexam/features/home/presentation/home_page.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
    with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  final List<String> studyYears = ["الفرقة الأولى", "الفرقة الثانية"];
  String? selectedStudyYear;
  String? selectedGender;

  // Form validation errors
  String? _nameError;
  String? _emailError;
  String? _passwordError;
  String? _confirmPasswordError;

  // Animation controller
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
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _validateName(String value) {
    setState(() {
      if (value.isEmpty) {
        _nameError = 'يرجى إدخال الاسم';
      } else if (value.length < 3) {
        _nameError = 'الاسم يجب أن يكون 3 أحرف على الأقل';
      } else {
        _nameError = null;
      }
    });
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

      if (confirmPasswordController.text.isNotEmpty) {
        _validateConfirmPassword(confirmPasswordController.text);
      }
    });
  }

  void _validateConfirmPassword(String value) {
    setState(() {
      if (value.isEmpty) {
        _confirmPasswordError = 'يرجى تأكيد كلمة المرور';
      } else if (value != passwordController.text) {
        _confirmPasswordError = 'كلمتا المرور غير متطابقتين';
      } else {
        _confirmPasswordError = null;
      }
    });
  }

  void _handleRegister() async {
    _validateName(nameController.text);
    _validateEmail(emailController.text);
    _validatePassword(passwordController.text);
    _validateConfirmPassword(confirmPasswordController.text);

    if (_nameError == null &&
        _emailError == null &&
        _passwordError == null &&
        _confirmPasswordError == null) {
      if (selectedStudyYear == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('يرجى اختيار السنة الدراسية',
                textAlign: TextAlign.right),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(10),
          ),
        );
        return;
      }

      if (selectedGender == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                const Text('يرجى اختيار الجنس', textAlign: TextAlign.right),
            backgroundColor: Colors.redAccent,
            behavior: SnackBarBehavior.floating,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            margin: const EdgeInsets.all(10),
          ),
        );
        return;
      }

      setState(() {
        _isLoading = true;
      });

      await Future.delayed(const Duration(seconds: 2));

      if (mounted) {
        setState(() {
          _isLoading = false;
        });

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content:
                const Text('تم إنشاء الحساب بنجاح', textAlign: TextAlign.right),
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
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back_ios,
                              color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Text(
                          "إنشاء حساب جديد",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: const RadialGradient(
                            colors: [
                              AppTheme.secondaryColor,
                              Color(0xFF27ae60),
                            ],
                            center: Alignment.center,
                            radius: 0.8,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppTheme.secondaryColor.withOpacity(0.3),
                              blurRadius: 15,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.person_add,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      "انضم إلى مجتمعنا",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "أنشئ حسابك لبدء رحلة التفوق في المجال الطبي",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "المعلومات الشخصية",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: nameController,
                            textAlign: TextAlign.right,
                            onChanged: _validateName,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "الاسم الكامل",
                              errorText: _nameError,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Colors.white24),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Colors.white24),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: AppTheme.secondaryColor),
                              ),
                              prefixIcon: const Icon(Icons.person_outline,
                                  color: AppTheme.secondaryColor),
                              labelStyle:
                                  const TextStyle(color: Colors.white70),
                              errorStyle:
                                  const TextStyle(color: Colors.redAccent),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.05),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: emailController,
                            textAlign: TextAlign.right,
                            keyboardType: TextInputType.emailAddress,
                            onChanged: _validateEmail,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "البريد الإلكتروني",
                              errorText: _emailError,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Colors.white24),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Colors.white24),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: AppTheme.secondaryColor),
                              ),
                              prefixIcon: const Icon(Icons.email_outlined,
                                  color: AppTheme.secondaryColor),
                              labelStyle:
                                  const TextStyle(color: Colors.white70),
                              errorStyle:
                                  const TextStyle(color: Colors.redAccent),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.05),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            "الجنس",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white70,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedGender = "أنثى";
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    decoration: BoxDecoration(
                                      color: selectedGender == "أنثى"
                                          ? AppTheme.secondaryColor
                                              .withOpacity(0.2)
                                          : Colors.white.withOpacity(0.05),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: selectedGender == "أنثى"
                                            ? AppTheme.secondaryColor
                                            : Colors.white24,
                                        width: 1,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "أنثى",
                                          style: TextStyle(
                                            color: selectedGender == "أنثى"
                                                ? AppTheme.secondaryColor
                                                : Colors.white70,
                                            fontWeight: selectedGender == "أنثى"
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Icon(
                                          Icons.female,
                                          color: selectedGender == "أنثى"
                                              ? AppTheme.secondaryColor
                                              : Colors.white70,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      selectedGender = "ذكر";
                                    });
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    decoration: BoxDecoration(
                                      color: selectedGender == "ذكر"
                                          ? AppTheme.secondaryColor
                                              .withOpacity(0.2)
                                          : Colors.white.withOpacity(0.05),
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                        color: selectedGender == "ذكر"
                                            ? AppTheme.secondaryColor
                                            : Colors.white24,
                                        width: 1,
                                      ),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "ذكر",
                                          style: TextStyle(
                                            color: selectedGender == "ذكر"
                                                ? AppTheme.secondaryColor
                                                : Colors.white70,
                                            fontWeight: selectedGender == "ذكر"
                                                ? FontWeight.bold
                                                : FontWeight.normal,
                                          ),
                                        ),
                                        const SizedBox(width: 8),
                                        Icon(
                                          Icons.male,
                                          color: selectedGender == "ذكر"
                                              ? AppTheme.secondaryColor
                                              : Colors.white70,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "أمان الحساب",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: passwordController,
                            textAlign: TextAlign.right,
                            obscureText: true,
                            onChanged: _validatePassword,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "كلمة المرور",
                              errorText: _passwordError,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Colors.white24),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Colors.white24),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: AppTheme.secondaryColor),
                              ),
                              prefixIcon: const Icon(Icons.lock_outline,
                                  color: AppTheme.secondaryColor),
                              labelStyle:
                                  const TextStyle(color: Colors.white70),
                              errorStyle:
                                  const TextStyle(color: Colors.redAccent),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.05),
                            ),
                          ),
                          const SizedBox(height: 16),
                          TextFormField(
                            controller: confirmPasswordController,
                            textAlign: TextAlign.right,
                            obscureText: true,
                            onChanged: _validateConfirmPassword,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              labelText: "تأكيد كلمة المرور",
                              errorText: _confirmPasswordError,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Colors.white24),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide:
                                    const BorderSide(color: Colors.white24),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12),
                                borderSide: const BorderSide(
                                    color: AppTheme.secondaryColor),
                              ),
                              prefixIcon: const Icon(Icons.lock_outline,
                                  color: AppTheme.secondaryColor),
                              labelStyle:
                                  const TextStyle(color: Colors.white70),
                              errorStyle:
                                  const TextStyle(color: Colors.redAccent),
                              filled: true,
                              fillColor: Colors.white.withOpacity(0.05),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2A2A2A),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const Text(
                            "معلومات الدراسة",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: AppTheme.primaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                  color:
                                      AppTheme.primaryColor.withOpacity(0.3)),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  "معهد فني تمريض",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 8),
                                Icon(
                                  Icons.school,
                                  color: AppTheme.primaryColor,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.05),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.white24),
                            ),
                            child: DropdownButtonFormField<String>(
                              decoration: const InputDecoration(
                                labelText: "السنة الدراسية",
                                border: InputBorder.none,
                                contentPadding:
                                    EdgeInsets.symmetric(horizontal: 16),
                                labelStyle: TextStyle(color: Colors.white70),
                              ),
                              dropdownColor: const Color(0xFF2A2A2A),
                              value: selectedStudyYear,
                              icon: const Icon(Icons.arrow_drop_down,
                                  color: Colors.white70),
                              items: studyYears
                                  .map((year) => DropdownMenuItem(
                                        value: year,
                                        child: Align(
                                          alignment: Alignment.centerRight,
                                          child: Text(
                                            year,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              onChanged: (value) {
                                setState(() {
                                  selectedStudyYear = value;
                                });
                              },
                              validator: (value) => value == null
                                  ? 'يرجى اختيار السنة الدراسية'
                                  : null,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Container(
                      width: double.infinity,
                      height: 56,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          colors: [
                            AppTheme.secondaryColor,
                            Color(0xFF27ae60),
                          ],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.secondaryColor.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ElevatedButton(
                        onPressed: _isLoading ? null : _handleRegister,
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
                                'إنشاء حساب',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => LoginScreen()),
                              );
                            },
                            child: const Text(
                              "تسجيل الدخول",
                              style: TextStyle(
                                color: AppTheme.primaryColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          const Text(
                            "لديك حساب بالفعل؟ ",
                            style: TextStyle(color: Colors.white70),
                          ),
                        ],
                      ),
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
