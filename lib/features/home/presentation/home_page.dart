import 'package:flutter/material.dart';

// --- تصحيح مسارات الاستيراد ---
import 'main_sections_screen.dart';
import '../../materials/presentation/materials_screen.dart';
import '../../profile/presentation/profile_screen.dart';
import '../../settings/presentation/settings_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // الحالة الأولية ستكون آخر صفحة في القائمة (الرئيسية)
  int _currentIndex = 3;

  // 1. تم ترتيب الصفحات لتطابق ترتيب النقر من اليسار لليمين
  final List<Widget> _pages = [
    SettingsScreen(), // index 0
    ProfileScreen(), // index 1
    MaterialsScreen(), // index 2
    MainSectionsScreen(), // index 3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xFF1E1E1E),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
              offset: Offset(0, -3),
            ),
          ],
        ),
        child: BottomNavigationBar(
          // 2. currentIndex يشير مباشرة إلى العنصر المختار
          currentIndex: _currentIndex,
          onTap: (index) {
            // 3. عند النقر، يتم تحديث الحالة مباشرة بدون أي منطق عكسي
            setState(() {
              _currentIndex = index;
            });
          },
          backgroundColor: const Color(0xFF1E1E1E),
          selectedItemColor: const Color(0xFF3498db),
          unselectedItemColor: Colors.white54,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedLabelStyle: const TextStyle(fontFamily: 'Cairo'),
          unselectedLabelStyle: const TextStyle(fontFamily: 'Cairo'),
          // 4. تم عكس ترتيب الأيقونات لتظهر بالشكل الصحيح من اليمين لليسار
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: "الإعدادات",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "الملف الشخصي",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.menu_book),
              label: "المواد",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "الرئيسية",
            ),
          ],
        ),
      ),
    );
  }
}
