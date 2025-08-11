import 'package:flutter/material.dart';
// --- تصحيح مسار الاستيراد ---
import '../../../core/theme/app_theme.dart';

class MaterialDetailScreen extends StatelessWidget {
  final String subject;

  // تعديل المنشئ ليقبل super.key
  const MaterialDetailScreen({super.key, required this.subject});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subject, style: const TextStyle(fontFamily: 'Cairo')),
        backgroundColor: AppTheme.surfaceColor,
        elevation: 0,
      ),
      body: Directionality(
        textDirection:
            TextDirection.rtl, // لضمان اتجاه العناصر من اليمين لليسار
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const ListTile(
              leading: Icon(Icons.picture_as_pdf, color: Colors.red),
              title: Text('ملخصات PDF', style: TextStyle(fontFamily: 'Cairo')),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: null, // استخدام null بدلاً من دالة فارغة
            ),
            const Divider(color: Colors.white24),
            const ListTile(
              leading: Icon(Icons.ondemand_video, color: Colors.purple),
              title:
                  Text('فيديوهات شرح', style: TextStyle(fontFamily: 'Cairo')),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: null,
            ),
            const Divider(color: Colors.white24),
            const ListTile(
              leading: Icon(Icons.help, color: Colors.orange),
              title: Text('بنك أسئلة', style: TextStyle(fontFamily: 'Cairo')),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: null,
            ),
            const Divider(color: Colors.white24),
            const ListTile(
              leading: Icon(Icons.quiz, color: Colors.green),
              title: Text('اختبار ذاتي', style: TextStyle(fontFamily: 'Cairo')),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: null,
            ),
            const Divider(color: Colors.white24),
            const SizedBox(height: 30),

            // Recent Files
            const Text(
              "الملفات المضافة حديثاً",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Cairo',
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(height: 16),

            Card(
              color: const Color(0xFF2A2A2A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.red.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.picture_as_pdf, color: Colors.red),
                ),
                title: const Text('ملخص الفصل الأول.pdf',
                    style: TextStyle(fontFamily: 'Cairo')),
                subtitle: const Text('تم الإضافة: 2 أغسطس 2025',
                    style: TextStyle(fontFamily: 'Cairo', fontSize: 12)),
                trailing: const Icon(Icons.download, color: Colors.white70),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 8),
            Card(
              color: const Color(0xFF2A2A2A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.purple.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.video_file, color: Colors.purple),
                ),
                title: const Text('شرح الدرس الثاني.mp4',
                    style: TextStyle(fontFamily: 'Cairo')),
                subtitle: const Text('تم الإضافة: 1 أغسطس 2025',
                    style: TextStyle(fontFamily: 'Cairo', fontSize: 12)),
                trailing: const Icon(Icons.play_circle_outline,
                    color: Colors.white70),
                onTap: () {},
              ),
            ),
            const SizedBox(height: 8),
            Card(
              color: const Color(0xFF2A2A2A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.orange.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.quiz, color: Colors.orange),
                ),
                title: const Text('أسئلة المراجعة النهائية.pdf',
                    style: TextStyle(fontFamily: 'Cairo')),
                subtitle: const Text('تم الإضافة: 30 يوليو 2025',
                    style: TextStyle(fontFamily: 'Cairo', fontSize: 12)),
                trailing: const Icon(Icons.download, color: Colors.white70),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
