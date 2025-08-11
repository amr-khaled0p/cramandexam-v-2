import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../materials/presentation/material_detail_screen.dart';
import '../../materials/presentation/summaries_screen.dart';
import '../../profile/presentation/records_screen.dart';
import '../../materials/presentation/videos_screen.dart';
import '../../exams/presentation/questions_bank_screen.dart';
import '../../exams/presentation/exams_screen.dart';

class MainSectionsScreen extends StatefulWidget {
  const MainSectionsScreen({super.key});

  @override
  _MainSectionsScreenState createState() => _MainSectionsScreenState();
}

class _MainSectionsScreenState extends State<MainSectionsScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;

  final List<Map<String, dynamic>> featuredCourses = [
    {
      'title': '\u062a\u0634\u0631\u064a\u062d',
      'description':
          '\u0623\u0633\u0627\u0633\u064a\u0627\u062a \u0627\u0644\u062c\u0647\u0627\u0632 \u0627\u0644\u0639\u0636\u0644\u064a',
      'progress': 0.65,
      'image': 'anatomy',
      'color': AppTheme.primaryColor,
    },
    {
      'title':
          '\u0641\u0627\u0631\u0645\u0627\u0643\u0648\u0644\u0648\u062c\u064a',
      'description':
          '\u0627\u0644\u0645\u0636\u0627\u062f\u0627\u062a \u0627\u0644\u062d\u064a\u0648\u064a\u0629 \u0648\u0622\u0644\u064a\u0629 \u0639\u0645\u0644\u0647\u0627',
      'progress': 0.32,
      'image': 'pharmacology',
      'color': AppTheme.secondaryColor,
    },
    {
      'title': '\u062a\u0645\u0631\u064a\u0636 \u062f\u0627\u062e\u0644\u064a',
      'description':
          '\u0631\u0639\u0627\u064a\u0629 \u0645\u0631\u0636\u0649 \u0627\u0644\u0642\u0644\u0628',
      'progress': 0.85,
      'image': 'nursing',
      'color': AppTheme.errorColor,
    },
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SafeArea(
          child: CustomScrollView(
            slivers: [
              _buildAppBar(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildSearchBar(),
                      const SizedBox(height: 24),
                      _buildSectionHeader(
                          "\u0645\u062a\u0627\u0628\u0639\u0629 \u0627\u0644\u062a\u0639\u0644\u0645",
                          null),
                      const SizedBox(height: 16),
                      _buildContinueLearningSection(),
                      const SizedBox(height: 30),
                      _buildSectionHeader(
                          "\u0627\u0644\u0623\u0642\u0633\u0627\u0645 \u0627\u0644\u062f\u0631\u0627\u0633\u064a\u0629",
                          "\u0639\u0631\u0636 \u0627\u0644\u0643\u0644"),
                      const SizedBox(height: 16),
                      _buildLearningPathsGrid(),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return SliverAppBar(
      expandedHeight: 120,
      floating: false,
      pinned: true,
      backgroundColor: AppTheme.surfaceColor,
      flexibleSpace: FlexibleSpaceBar(
        title: const Text(
          "\u0627\u0644\u0631\u0626\u064a\u0633\u064a\u0629",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Cairo',
            fontSize: 20,
          ),
        ),
        titlePadding: const EdgeInsetsDirectional.only(start: 16, bottom: 16),
        background: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                AppTheme.primaryColor.withOpacity(0.8),
                AppTheme.surfaceColor,
              ],
            ),
          ),
          child: const Stack(
            children: [
              Positioned(
                top: -20,
                right: -20,
                child: Opacity(
                  opacity: 0.1,
                  child: Icon(
                    Icons.medical_services,
                    size: 120,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {},
          tooltip:
              '\u0627\u0644\u0645\u0644\u0641 \u0627\u0644\u0634\u062e\u0635\u064a',
        ),
        IconButton(
          icon: const Icon(Icons.notifications),
          onPressed: () {},
          tooltip: '\u0627\u0644\u0625\u0634\u0639\u0627\u0631\u0627\u062a',
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 56,
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
      child: TextField(
        controller: _searchController,
        textAlign: TextAlign.right,
        textDirection: TextDirection.rtl,
        style: const TextStyle(color: Colors.white, fontFamily: 'Cairo'),
        decoration: InputDecoration(
          hintText:
              "\u0627\u0628\u062d\u062b \u0639\u0646 \u0627\u0644\u0645\u0648\u0627\u062f...",
          hintStyle:
              const TextStyle(color: Colors.white54, fontFamily: 'Cairo'),
          prefixIcon: const Icon(Icons.search, color: AppTheme.primaryColor),
          suffixIcon: _isSearching
              ? IconButton(
                  icon: const Icon(Icons.clear, color: Colors.white54),
                  onPressed: () {
                    setState(() {
                      _searchController.clear();
                      _isSearching = false;
                    });
                  },
                )
              : null,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
        onChanged: (value) {
          setState(() {
            _isSearching = value.isNotEmpty;
          });
        },
      ),
    );
  }

  Widget _buildSectionHeader(String title, String? actionText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
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
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildContinueLearningSection() {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: featuredCourses.length,
        itemBuilder: (context, index) {
          final course = featuredCourses[index];
          return AnimatedBuilder(
            animation: _animationController,
            builder: (context, child) {
              final delay = index * 0.2;
              final value = _animationController.value > delay
                  ? (_animationController.value - delay) / (1 - delay)
                  : 0.0;
              final opacity = value.clamp(0.0, 1.0);
              final slideX = (1 - value) * 50;

              return Opacity(
                opacity: opacity,
                child: Transform.translate(
                  offset: Offset(slideX, 0),
                  child: child,
                ),
              );
            },
            child: GestureDetector(
              onTap: () {
                // Navigate to MaterialDetailScreen when a course card is tapped
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MaterialDetailScreen(
                      subject: course['title'],
                    ),
                  ),
                );
              },
              child: Container(
                width: 280,
                margin: const EdgeInsets.only(left: 16),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      course['color'],
                      course['color'].withOpacity(0.7),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: course['color'].withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    const Positioned(
                      left: -20,
                      bottom: -20,
                      child: Opacity(
                        opacity: 0.2,
                        child: Icon(
                          Icons.medical_services,
                          size: 150,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            course['title'],
                            style: const TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontFamily: 'Cairo',
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            course['description'],
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontFamily: 'Cairo',
                              fontSize: 14,
                            ),
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${(course['progress'] * 100).toInt()}% \u0645\u0643\u062a\u0645\u0644",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(4),
                                      child: LinearProgressIndicator(
                                        value: course['progress'],
                                        backgroundColor: Colors.white30,
                                        valueColor:
                                            const AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                        minHeight: 6,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 16),
                              Container(
                                width: 42,
                                height: 42,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black26,
                                      blurRadius: 6,
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Icon(
                                  Icons.play_arrow,
                                  color: course['color'],
                                  size: 28,
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
        },
      ),
    );
  }

  Widget _buildLearningPathsGrid() {
    // Redesigned learning paths with better visual hierarchy
    return Column(
      children: [
        // Primary row - Learning content (more prominent)
        Row(
          children: [
            // Expanded column for \u0627\u0644\u0634\u0631\u0648\u062d\u0627\u062a (Videos)
            Expanded(
              flex: 3,
              child: _buildPrimaryPathCard(
                "\u0627\u0644\u0634\u0631\u0648\u062d\u0627\u062a",
                "8 \u0641\u064a\u062f\u064a\u0648",
                AppTheme.errorColor,
                Icons.play_circle_fill,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const VideosScreen()),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            // Column for \u0627\u0644\u0645\u0644\u062e\u0635\u0627\u062a and \u0627\u0644\u0631\u064a\u0643\u0648\u0631\u062f\u0627\u062a
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  _buildSecondaryPathCard(
                    "\u0627\u0644\u0645\u0644\u062e\u0635\u0627\u062a",
                    "12 \u0645\u0644\u0641",
                    AppTheme.primaryColor,
                    Icons.menu_book,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SummariesScreen()),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  _buildSecondaryPathCard(
                    "\u0627\u0644\u0631\u064a\u0643\u0648\u0631\u062f\u0627\u062a",
                    "15 \u0631\u064a\u0643\u0648\u0631\u062f",
                    AppTheme.purpleColor,
                    Icons.mic,
                    () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RecordsScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Secondary row - Practice and assessment (less prominent)
        Row(
          children: [
            // Expanded for \u0627\u0644\u0623\u0633\u0626\u0644\u0629
            Expanded(
              child: _buildSecondaryPathCard(
                "\u0627\u0644\u0623\u0633\u0626\u0644\u0629",
                "10 \u0628\u0646\u0643 \u0623\u0633\u0626\u0644\u0629",
                AppTheme.secondaryColor,
                Icons.help_outline,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const QuestionsBankScreen()),
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            // Expanded for \u0627\u0644\u0627\u062e\u062a\u0628\u0627\u0631\u0627\u062a
            Expanded(
              child: _buildSecondaryPathCard(
                "\u0627\u0644\u0627\u062e\u062a\u0628\u0627\u0631\u0627\u062a",
                "6 \u0627\u062e\u062a\u0628\u0627\u0631",
                AppTheme.warningColor,
                Icons.assignment,
                () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ExamsScreen()),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPrimaryPathCard(
    String title,
    String subtitle,
    Color color,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              color,
              color.withOpacity(0.7),
            ],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.3),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Stack(
          children: [
            Positioned(
              right: -30,
              bottom: -30,
              child: Icon(
                icon,
                size: 150,
                color: Colors.white.withOpacity(0.2),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      icon,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontFamily: 'Cairo',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecondaryPathCard(
    String title,
    String subtitle,
    Color color,
    IconData icon,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: 92, // Half the height of the primary card
        decoration: BoxDecoration(
          color: const Color(0xFF2A2A2A),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 3),
            ),
          ],
          border: Border.all(
            color: color.withOpacity(0.3),
            width: 2,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
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
                  size: 28,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
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
                    Text(
                      subtitle,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.7),
                        fontFamily: 'Cairo',
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: color,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
