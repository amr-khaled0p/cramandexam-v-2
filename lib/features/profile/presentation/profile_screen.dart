import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../settings/presentation/settings_screen.dart';
import 'dart:math' as math;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // Sample data for the profile screen
  final Map<String, dynamic> userData = {
    'name': '\u0623\u062d\u0645\u062f \u0645\u062d\u0645\u062f',
    'avatar': 'https://i.pravatar.cc/150?img=8',
    'academicYear':
        '\u0645\u0639\u0647\u062f \u0641\u0646\u064a \u062a\u0645\u0631\u064a\u0636 - \u0627\u0644\u0633\u0646\u0629 \u0627\u0644\u0623\u0648\u0644\u0649',
    'stats': {
      'subscribedCourses': 8,
      'studyHours': 42,
      'downloadedFiles': 15,
    },
    'lastOpenedFiles': [
      {
        'title':
            '\u0645\u0644\u062e\u0635 \u0623\u0633\u0627\u0633\u064a\u0627\u062a \u0627\u0644\u062a\u0645\u0631\u064a\u0636',
        'type': 'pdf',
        'date': '8 \u0623\u063a\u0633\u0637\u0633 2025',
        'color': AppTheme.primaryColor,
      },
      {
        'title':
            '\u0645\u062d\u0627\u0636\u0631\u0629 \u0639\u0644\u0645 \u0627\u0644\u062a\u0634\u0631\u064a\u062d',
        'type': 'video',
        'date': '7 \u0623\u063a\u0633\u0637\u0633 2025',
        'color': AppTheme.errorColor,
      },
      {
        'title':
            '\u0627\u062e\u062a\u0628\u0627\u0631 \u0645\u064a\u0643\u0631\u0648\u0628\u0627\u064a\u0648\u0644\u0648\u062c\u064a',
        'type': 'quiz',
        'date': '6 \u0623\u063a\u0633\u0637\u0633 2025',
        'color': AppTheme.secondaryColor,
      },
    ],
    'savedCourses': [
      {
        'title':
            '\u0623\u0633\u0627\u0633\u064a\u0627\u062a \u0627\u0644\u062a\u0645\u0631\u064a\u0636 \u0646\u0638\u0631\u064a',
        'progress': 0.65,
        'color': AppTheme.primaryColor,
      },
      {
        'title':
            '\u0639\u0644\u0645 \u0627\u0644\u062a\u0634\u0631\u064a\u062d',
        'progress': 0.78,
        'color': AppTheme.errorColor,
      },
      {
        'title':
            '\u0645\u064a\u0643\u0631\u0648\u0628\u0627\u064a\u0648\u0644\u0648\u062c\u064a',
        'progress': 0.25,
        'color': AppTheme.warningColor,
      },
    ],
    'weeklyActivity': [
      {'day': '\u0627\u0644\u0633\u0628\u062a', 'hours': 1.5},
      {'day': '\u0627\u0644\u0623\u062d\u062f', 'hours': 2.0},
      {'day': '\u0627\u0644\u0625\u062b\u0646\u064a\u0646', 'hours': 0.5},
      {'day': '\u0627\u0644\u062b\u0644\u0627\u062b\u0627\u0621', 'hours': 3.0},
      {'day': '\u0627\u0644\u0623\u0631\u0628\u0639\u0627\u0621', 'hours': 1.0},
      {'day': '\u0627\u0644\u062e\u0645\u064a\u0633', 'hours': 2.5},
      {'day': '\u0627\u0644\u062c\u0645\u0639\u0629', 'hours': 0.0},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppTheme.backgroundColor,
        body: CustomScrollView(
          slivers: [
            // App Bar with Profile Header
            SliverAppBar(
              expandedHeight: 200,
              pinned: true,
              backgroundColor: AppTheme.surfaceColor,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppTheme.primaryColor.withOpacity(0.8),
                        AppTheme.surfaceColor,
                      ],
                    ),
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    NetworkImage(userData['avatar']),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userData['name'],
                                      style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                    Text(
                                      userData['academicYear'],
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white70,
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              IconButton(
                                icon: const Icon(Icons.settings,
                                    color: Colors.white),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const SettingsScreen()),
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                title: const Text(''),
              ),
              actions: [
                IconButton(
                  icon: const Icon(Icons.edit),
                  onPressed: () {},
                  tooltip:
                      '\u062a\u0639\u062f\u064a\u0644 \u0627\u0644\u0645\u0644\u0641 \u0627\u0644\u0634\u062e\u0635\u064a',
                ),
              ],
            ),

            // Content
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Statistics Dashboard
                    _buildStatisticsDashboard(),
                    const SizedBox(height: 24),

                    // Quick Access - Last Opened Files
                    _buildSectionHeader(
                        '\u0627\u0644\u0648\u0635\u0648\u0644 \u0627\u0644\u0633\u0631\u064a\u0639',
                        '\u0639\u0631\u0636 \u0627\u0644\u0643\u0644'),
                    const SizedBox(height: 16),
                    _buildQuickAccessSection(),
                    const SizedBox(height: 24),

                    // Weekly Progress Chart
                    _buildSectionHeader(
                        '\u0646\u0634\u0627\u0637 \u0627\u0644\u0623\u0633\u0628\u0648\u0639',
                        null),
                    const SizedBox(height: 16),
                    _buildWeeklyProgressChart(),
                    const SizedBox(height: 24),

                    // Additional Actions
                    _buildAdditionalActions(),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatisticsDashboard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(
            '\u0627\u0644\u0645\u0648\u0627\u062f \u0627\u0644\u0645\u0634\u062a\u0631\u0643 \u0628\u0647\u0627',
            userData['stats']['subscribedCourses'].toString(),
            Icons.menu_book,
            AppTheme.primaryColor,
          ),
          _buildStatItem(
            '\u0633\u0627\u0639\u0627\u062a \u0627\u0644\u062f\u0631\u0627\u0633\u0629',
            userData['stats']['studyHours'].toString(),
            Icons.access_time,
            AppTheme.secondaryColor,
          ),
          _buildStatItem(
            '\u0645\u0644\u0641\u0627\u062a \u062a\u0645 \u062a\u062d\u0645\u064a\u0644\u0647\u0627',
            userData['stats']['downloadedFiles'].toString(),
            Icons.file_download,
            AppTheme.errorColor,
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
      String label, String value, IconData icon, Color color) {
    return Column(
      children: [
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          value,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Cairo',
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.white70,
            fontFamily: 'Cairo',
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSectionHeader(String title, String? actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Cairo',
          ),
        ),
        if (actionText != null)
          TextButton(
            onPressed: () {},
            child: Text(
              actionText,
              style: const TextStyle(
                color: AppTheme.primaryColor,
                fontFamily: 'Cairo',
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildQuickAccessSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Last Opened Files
        const Text(
          '\u0622\u062e\u0631 \u0627\u0644\u0645\u0644\u0641\u0627\u062a \u0627\u0644\u0645\u0641\u062a\u0648\u062d\u0629',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Cairo',
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: userData['lastOpenedFiles'].length,
            itemBuilder: (context, index) {
              final file = userData['lastOpenedFiles'][index];
              return Container(
                width: 200,
                margin: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: file['color'].withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                _getFileIcon(file['type']),
                                color: file['color'],
                                size: 24,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                file['type'].toUpperCase(),
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: file['color'],
                                  fontFamily: 'Cairo',
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Text(
                          file['title'],
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Cairo',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          file['date'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white54,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 20),

        // Saved Courses
        const Text(
          '\u0627\u0644\u0645\u0648\u0627\u062f \u0627\u0644\u0645\u062d\u0641\u0648\u0638\u0629',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Cairo',
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: userData['savedCourses'].length,
            itemBuilder: (context, index) {
              final course = userData['savedCourses'][index];
              return Container(
                width: 200,
                margin: const EdgeInsets.only(left: 12),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      course['color'],
                      course['color'].withOpacity(0.7),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          course['title'],
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontFamily: 'Cairo',
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${(course['progress'] * 100).toInt()}% \u0645\u0643\u062a\u0645\u0644",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            const SizedBox(height: 4),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(2),
                              child: LinearProgressIndicator(
                                value: course['progress'],
                                backgroundColor: Colors.white30,
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Colors.white),
                                minHeight: 4,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildWeeklyProgressChart() {
    final weeklyData = userData['weeklyActivity'] as List;
    final maxHours = weeklyData.fold(
        0.0, (max, item) => math.max(max as double, item['hours'] as double));

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '\u0633\u0627\u0639\u0627\u062a \u0627\u0644\u062f\u0631\u0627\u0633\u0629 \u0627\u0644\u0623\u0633\u0628\u0648\u0639\u064a\u0629',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Cairo',
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: weeklyData.map<Widget>((day) {
                final double hours = day['hours'];
                final double percentage = maxHours > 0 ? hours / maxHours : 0;
                final bool isToday = day['day'] ==
                    '\u0627\u0644\u062b\u0644\u0627\u062b\u0627\u0621'; // For demo purposes

                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '${hours.toStringAsFixed(1)}',
                          style: TextStyle(
                            fontSize: 12,
                            color: isToday
                                ? AppTheme.primaryColor
                                : Colors.white70,
                            fontWeight:
                                isToday ? FontWeight.bold : FontWeight.normal,
                            fontFamily: 'Cairo',
                          ),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          height: 150 * percentage,
                          width: 24,
                          decoration: BoxDecoration(
                            color: isToday
                                ? AppTheme.primaryColor
                                : AppTheme.primaryColor.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          day['day'],
                          style: TextStyle(
                            fontSize: 12,
                            color: isToday
                                ? AppTheme.primaryColor
                                : Colors.white70,
                            fontWeight:
                                isToday ? FontWeight.bold : FontWeight.normal,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAdditionalActions() {
    return Column(
      children: [
        _buildActionButton(
          '\u062a\u0642\u0627\u0631\u064a\u0631 \u0627\u0644\u062a\u0642\u062f\u0645',
          '\u062a\u062a\u0628\u0639 \u062a\u0642\u062f\u0645\u0643 \u0641\u064a \u062c\u0645\u064a\u0639 \u0627\u0644\u0645\u0648\u0627\u062f',
          Icons.bar_chart,
          AppTheme.primaryColor,
        ),
        const SizedBox(height: 12),
        _buildActionButton(
          '\u062c\u062f\u0648\u0644 \u0627\u0644\u0645\u0630\u0627\u0643\u0631\u0629',
          '\u062a\u0646\u0638\u064a\u0645 \u0648\u0642\u062a \u0627\u0644\u062f\u0631\u0627\u0633\u0629 \u0627\u0644\u062e\u0627\u0635 \u0628\u0643',
          Icons.calendar_today,
          AppTheme.secondaryColor,
        ),
      ],
    );
  }

  Widget _buildActionButton(
      String title, String subtitle, IconData icon, Color color) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surfaceColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color,
            size: 24,
          ),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Cairo',
          ),
        ),
        subtitle: Text(
          subtitle,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.white54,
            fontFamily: 'Cairo',
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: Colors.white54,
          size: 16,
        ),
        onTap: () {},
      ),
    );
  }

  IconData _getFileIcon(String type) {
    switch (type) {
      case 'pdf':
        return Icons.picture_as_pdf;
      case 'video':
        return Icons.video_library;
      case 'quiz':
        return Icons.quiz;
      default:
        return Icons.insert_drive_file;
    }
  }
}
