import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class ExamsScreen extends StatefulWidget {
  const ExamsScreen({super.key});

  @override
  State<ExamsScreen> createState() => _ExamsScreenState();
}

class _ExamsScreenState extends State<ExamsScreen> {
  final List<Map<String, dynamic>> upcomingExams = [
    {
      'title': 'اختبار نصف الفصل - أساسيات التمريض',
      'date': '15 أغسطس 2025',
      'time': '10:00 صباحاً',
      'duration': '60 دقيقة',
      'questions': 30,
      'color': AppTheme.primaryColor,
    },
    {
      'title': 'اختبار عملي - أساسيات تمريض عملي',
      'date': '18 أغسطس 2025',
      'time': '11:30 صباحاً',
      'duration': '90 دقيقة',
      'questions': 15,
      'color': AppTheme.secondaryColor,
    },
    {
      'title': 'اختبار قصير - علم التشريح',
      'date': '20 أغسطس 2025',
      'time': '9:00 صباحاً',
      'duration': '30 دقيقة',
      'questions': 20,
      'color': AppTheme.errorColor,
    },
  ];

  final List<Map<String, dynamic>> pastExams = [
    {
      'title': 'اختبار تجريبي - ميكروبايولوجي',
      'date': '5 أغسطس 2025',
      'score': 85,
      'total': 100,
      'color': AppTheme.warningColor,
    },
    {
      'title': 'اختبار نهائي - أخلاقيات التمريض',
      'date': '28 يوليو 2025',
      'score': 92,
      'total': 100,
      'color': AppTheme.purpleColor,
    },
    {
      'title': 'اختبار نصف الفصل - علم وظائف الأعضاء',
      'date': '15 يوليو 2025',
      'score': 78,
      'total': 100,
      'color': AppTheme.primaryColor,
    },
  ];

  final List<Map<String, dynamic>> practiceExams = [
    {
      'title': 'اختبار تدريبي شامل - أساسيات التمريض',
      'questions': 50,
      'time': '60 دقيقة',
      'attempts': 'غير محدود',
      'color': AppTheme.primaryColor,
    },
    {
      'title': 'اختبار تدريبي - علم التشريح',
      'questions': 40,
      'time': '50 دقيقة',
      'attempts': 'غير محدود',
      'color': AppTheme.errorColor,
    },
    {
      'title': 'اختبار تدريبي - ميكروبايولوجي',
      'questions': 35,
      'time': '45 دقيقة',
      'attempts': 'غير محدود',
      'color': AppTheme.secondaryColor,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title:
              const Text('الاختبارات', style: TextStyle(fontFamily: 'Cairo')),
          backgroundColor: AppTheme.surfaceColor,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.notifications_none),
              onPressed: () {},
              tooltip: 'التنبيهات',
            ),
            IconButton(
              icon: const Icon(Icons.calendar_month),
              onPressed: () {},
              tooltip: 'التقويم',
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Upcoming exams section
                _buildSectionHeader('الاختبارات القادمة',
                    Icons.event_available), // <-- تم تصحيح الأيقونة هنا
                const SizedBox(height: 16),

                if (upcomingExams.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: upcomingExams.length,
                    itemBuilder: (context, index) {
                      final exam = upcomingExams[index];
                      return _buildUpcomingExamCard(exam);
                    },
                  )
                else
                  _buildEmptyState('لا توجد اختبارات قادمة',
                      'ستظهر هنا الاختبارات المجدولة القادمة'),

                const SizedBox(height: 32),

                // Practice exams section
                _buildSectionHeader('اختبارات تدريبية', Icons.fitness_center),
                const SizedBox(height: 16),

                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: practiceExams.length,
                  itemBuilder: (context, index) {
                    final exam = practiceExams[index];
                    return _buildPracticeExamCard(exam);
                  },
                ),

                const SizedBox(height: 32),

                // Past exams section
                _buildSectionHeader('الاختبارات السابقة', Icons.history),
                const SizedBox(height: 16),

                if (pastExams.isNotEmpty)
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: pastExams.length,
                    itemBuilder: (context, index) {
                      final exam = pastExams[index];
                      return _buildPastExamCard(exam);
                    },
                  )
                else
                  _buildEmptyState('لا توجد اختبارات سابقة',
                      'ستظهر هنا نتائج الاختبارات التي أكملتها'),

                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          color: AppTheme.primaryColor,
          size: 24,
        ),
        const SizedBox(width: 8),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Cairo',
          ),
        ),
      ],
    );
  }

  Widget _buildUpcomingExamCard(Map<String, dynamic> exam) {
    final Color color = exam['color'];

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: const Color(0xFF2A2A2A),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.assignment,
                      color: color,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exam['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Cairo',
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 14,
                              color: Colors.white.withOpacity(0.7),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              exam['date'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.7),
                                fontFamily: 'Cairo',
                              ),
                            ),
                            const SizedBox(width: 16),
                            Icon(
                              Icons.access_time,
                              size: 14,
                              color: Colors.white.withOpacity(0.7),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              exam['time'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.7),
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildExamInfoItem(
                        Icons.timer,
                        'المدة',
                        exam['duration'],
                      ),
                      _buildExamInfoItem(
                        Icons.help_outline,
                        'عدد الأسئلة',
                        '${exam['questions']} سؤال',
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.info_outline),
                          label: const Text('التفاصيل',
                              style: TextStyle(fontFamily: 'Cairo')),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.white,
                            side: const BorderSide(color: Colors.white54),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.notifications_active),
                          label: const Text('تذكير',
                              style: TextStyle(fontFamily: 'Cairo')),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: color,
                            foregroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPastExamCard(Map<String, dynamic> exam) {
    final Color color = exam['color'];
    final int score = exam['score'];
    final int total = exam['total'];
    final double percentage = score / total;

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: const Color(0xFF2A2A2A),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: percentage,
                      strokeWidth: 5,
                      backgroundColor: Colors.white.withOpacity(0.1),
                      valueColor: AlwaysStoppedAnimation<Color>(
                          _getScoreColor(percentage)),
                    ),
                    Center(
                      child: Text(
                        '$score%',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: color,
                          fontFamily: 'Cairo',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      exam['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Cairo',
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'تاريخ الاختبار: ${exam['date']}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.7),
                        fontFamily: 'Cairo',
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'الدرجة: $score من $total',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.white.withOpacity(0.7),
                            fontFamily: 'Cairo',
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'مراجعة الإجابات',
                            style: TextStyle(
                              color: AppTheme.primaryColor,
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPracticeExamCard(Map<String, dynamic> exam) {
    final Color color = exam['color'];

    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      color: const Color(0xFF2A2A2A),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.fitness_center,
                      color: color,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      exam['title'],
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildExamInfoItem(
                    Icons.help_outline,
                    'عدد الأسئلة',
                    '${exam['questions']} سؤال',
                  ),
                  _buildExamInfoItem(
                    Icons.timer,
                    'الوقت',
                    exam['time'],
                  ),
                  _buildExamInfoItem(
                    Icons.repeat,
                    'المحاولات',
                    exam['attempts'],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.play_arrow),
                  label: const Text('بدء الاختبار',
                      style: TextStyle(fontFamily: 'Cairo')),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExamInfoItem(IconData icon, String label, String value) {
    return Column(
      children: [
        Icon(
          icon,
          color: Colors.white70,
          size: 20,
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.5),
            fontFamily: 'Cairo',
          ),
        ),
        const SizedBox(height: 2),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
          ),
        ),
      ],
    );
  }

  Widget _buildEmptyState(String title, String subtitle) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Icon(
            Icons.event_busy,
            size: 60,
            color: Colors.white.withOpacity(0.3),
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Cairo',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.5),
              fontFamily: 'Cairo',
            ),
          ),
        ],
      ),
    );
  }

  Color _getScoreColor(double percentage) {
    if (percentage >= 0.85) {
      return AppTheme.secondaryColor;
    } else if (percentage >= 0.7) {
      return AppTheme.primaryColor;
    } else if (percentage >= 0.5) {
      return AppTheme.warningColor;
    } else {
      return AppTheme.errorColor;
    }
  }
}
