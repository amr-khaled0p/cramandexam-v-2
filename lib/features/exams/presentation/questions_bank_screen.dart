import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class QuestionsBankScreen extends StatefulWidget {
  const QuestionsBankScreen({super.key});

  @override
  State<QuestionsBankScreen> createState() => _QuestionsBankScreenState();
}

class _QuestionsBankScreenState extends State<QuestionsBankScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<Map<String, dynamic>> questionBanks = [
    {
      'title':
          '\u0623\u0633\u0627\u0633\u064a\u0627\u062a \u0627\u0644\u062a\u0645\u0631\u064a\u0636',
      'questions': 120,
      'difficulty': '\u0645\u062a\u0648\u0633\u0637',
      'lastUpdated': '8 \u0623\u063a\u0633\u0637\u0633 2025',
      'color': AppTheme.primaryColor,
      'categories': [
        '\u0627\u0644\u0641\u0635\u0644 \u0627\u0644\u0623\u0648\u0644',
        '\u0627\u0644\u0641\u0635\u0644 \u0627\u0644\u062b\u0627\u0646\u064a',
        '\u0627\u0644\u0641\u0635\u0644 \u0627\u0644\u062b\u0627\u0644\u062b'
      ],
    },
    {
      'title': '\u0639\u0644\u0645 \u0627\u0644\u062a\u0634\u0631\u064a\u062d',
      'questions': 85,
      'difficulty': '\u0635\u0639\u0628',
      'lastUpdated': '6 \u0623\u063a\u0633\u0637\u0633 2025',
      'color': AppTheme.errorColor,
      'categories': [
        '\u0627\u0644\u062c\u0647\u0627\u0632 \u0627\u0644\u0639\u0635\u0628\u064a',
        '\u0627\u0644\u062c\u0647\u0627\u0632 \u0627\u0644\u0639\u0636\u0644\u064a',
        '\u0627\u0644\u062c\u0647\u0627\u0632 \u0627\u0644\u0647\u0636\u0645\u064a'
      ],
    },
    {
      'title':
          '\u0645\u064a\u0643\u0631\u0648\u0628\u0627\u064a\u0648\u0644\u0648\u062c\u064a',
      'questions': 95,
      'difficulty': '\u0645\u062a\u0648\u0633\u0637',
      'lastUpdated': '4 \u0623\u063a\u0633\u0637\u0633 2025',
      'color': AppTheme.secondaryColor,
      'categories': [
        '\u0627\u0644\u0628\u0643\u062a\u064a\u0631\u064a\u0627',
        '\u0627\u0644\u0641\u064a\u0631\u0648\u0633\u0627\u062a',
        '\u0627\u0644\u0641\u0637\u0631\u064a\u0627\u062a'
      ],
    },
    {
      'title':
          '\u0623\u062e\u0644\u0627\u0642\u064a\u0627\u062a \u0627\u0644\u062a\u0645\u0631\u064a\u0636',
      'questions': 60,
      'difficulty': '\u0633\u0647\u0644',
      'lastUpdated': '2 \u0623\u063a\u0633\u0637\u0633 2025',
      'color': AppTheme.warningColor,
      'categories': [
        '\u062d\u0642\u0648\u0642 \u0627\u0644\u0645\u0631\u0636\u0649',
        '\u0627\u0644\u0633\u0631\u064a\u0629 \u0627\u0644\u0637\u0628\u064a\u0629',
        '\u0627\u0644\u0623\u062e\u0644\u0627\u0642\u064a\u0627\u062a \u0627\u0644\u0645\u0647\u0646\u064a\u0629'
      ],
    },
    {
      'title':
          '\u0639\u0644\u0645 \u0648\u0638\u0627\u0626\u0641 \u0627\u0644\u0623\u0639\u0636\u0627\u0621',
      'questions': 110,
      'difficulty': '\u0635\u0639\u0628',
      'lastUpdated': '31 \u064a\u0648\u0644\u064a\u0648 2025',
      'color': AppTheme.purpleColor,
      'categories': [
        '\u0627\u0644\u0642\u0644\u0628 \u0648\u0627\u0644\u062f\u0648\u0631\u0629 \u0627\u0644\u062f\u0645\u0648\u064a\u0629',
        '\u0627\u0644\u062c\u0647\u0627\u0632 \u0627\u0644\u062a\u0646\u0641\u0633\u064a',
        '\u0627\u0644\u062c\u0647\u0627\u0632 \u0627\u0644\u0628\u0648\u0644\u064a'
      ],
    },
  ];

  final List<String> categories = [
    '\u0627\u0644\u0643\u0644',
    '\u0623\u0633\u0627\u0633\u064a\u0627\u062a \u0627\u0644\u062a\u0645\u0631\u064a\u0636',
    '\u0639\u0644\u0645 \u0627\u0644\u062a\u0634\u0631\u064a\u062d',
    '\u0645\u064a\u0643\u0631\u0648\u0628\u0627\u064a\u0648\u0644\u0648\u062c\u064a',
    '\u0623\u062e\u0644\u0627\u0642\u064a\u0627\u062a \u0627\u0644\u062a\u0645\u0631\u064a\u0636',
    '\u0639\u0644\u0645 \u0648\u0638\u0627\u0626\u0641 \u0627\u0644\u0623\u0639\u0636\u0627\u0621',
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
              '\u0628\u0646\u0643 \u0627\u0644\u0623\u0633\u0626\u0644\u0629',
              style: TextStyle(fontFamily: 'Cairo')),
          backgroundColor: AppTheme.surfaceColor,
          elevation: 0,
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: AppTheme.primaryColor,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white60,
            labelStyle: const TextStyle(
                fontFamily: 'Cairo', fontWeight: FontWeight.bold),
            unselectedLabelStyle: const TextStyle(fontFamily: 'Cairo'),
            tabs: const [
              Tab(
                  text:
                      '\u0628\u0646\u0648\u0643 \u0627\u0644\u0623\u0633\u0626\u0644\u0629'),
              Tab(
                  text:
                      '\u0627\u0644\u0623\u0633\u0626\u0644\u0629 \u0627\u0644\u0645\u062d\u0641\u0648\u0638\u0629'),
              Tab(
                  text:
                      '\u0627\u0644\u0625\u062d\u0635\u0627\u0626\u064a\u0627\u062a'),
            ],
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
              tooltip: '\u0628\u062d\u062b',
            ),
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {},
              tooltip: '\u062a\u0635\u0641\u064a\u0629',
            ),
          ],
        ),
        body: TabBarView(
          controller: _tabController,
          children: [
            _buildQuestionBanksTab(),
            _buildSavedQuestionsTab(),
            _buildStatisticsTab(),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppTheme.primaryColor,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Widget _buildQuestionBanksTab() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Categories horizontal list
        SizedBox(
          height: 50,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.length,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            itemBuilder: (context, index) {
              final isSelected = index == 0;
              return Container(
                margin: const EdgeInsets.only(left: 8),
                child: FilterChip(
                  label: Text(categories[index]),
                  selected: isSelected,
                  onSelected: (bool selected) {},
                  backgroundColor: const Color(0xFF2A2A2A),
                  selectedColor: AppTheme.primaryColor,
                  checkmarkColor: Colors.white,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.white : Colors.white70,
                    fontFamily: 'Cairo',
                  ),
                ),
              );
            },
          ),
        ),

        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: questionBanks.length,
            itemBuilder: (context, index) {
              final bank = questionBanks[index];
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
                      // Header with color
                      Container(
                        height: 12,
                        decoration: BoxDecoration(
                          color: bank['color'],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
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
                                Expanded(
                                  child: Text(
                                    bank['title'],
                                    style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'Cairo',
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color:
                                        _getDifficultyColor(bank['difficulty'])
                                            .withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Text(
                                    bank['difficulty'],
                                    style: TextStyle(
                                      color: _getDifficultyColor(
                                          bank['difficulty']),
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Cairo',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Icon(
                                  Icons.help_outline,
                                  size: 16,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${bank['questions']} \u0633\u0624\u0627\u0644',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontFamily: 'Cairo',
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Icon(
                                  Icons.update,
                                  size: 16,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '\u0622\u062e\u0631 \u062a\u062d\u062f\u064a\u062b: ${bank['lastUpdated']}',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontFamily: 'Cairo',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            const Text(
                              '\u0627\u0644\u0623\u0642\u0633\u0627\u0645:',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Cairo',
                              ),
                            ),
                            const SizedBox(height: 8),
                            Wrap(
                              spacing: 8,
                              runSpacing: 8,
                              children: (bank['categories'] as List<String>)
                                  .map((category) {
                                return Chip(
                                  label: Text(
                                    category,
                                    style: const TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Cairo',
                                    ),
                                  ),
                                  backgroundColor:
                                      bank['color'].withOpacity(0.2),
                                  labelStyle: TextStyle(color: bank['color']),
                                  padding: EdgeInsets.zero,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                );
                              }).toList(),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: OutlinedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(Icons.play_arrow),
                                    label: const Text(
                                        '\u0628\u062f\u0621 \u0627\u0644\u062a\u0645\u0631\u064a\u0646',
                                        style: TextStyle(fontFamily: 'Cairo')),
                                    style: OutlinedButton.styleFrom(
                                      foregroundColor: bank['color'],
                                      side: BorderSide(color: bank['color']),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Expanded(
                                  child: ElevatedButton.icon(
                                    onPressed: () {},
                                    icon: const Icon(Icons.quiz),
                                    label: const Text(
                                        '\u0627\u062e\u062a\u0628\u0627\u0631',
                                        style: TextStyle(fontFamily: 'Cairo')),
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: bank['color'],
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
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSavedQuestionsTab() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.bookmark_border,
            size: 80,
            color: Colors.white.withOpacity(0.5),
          ),
          const SizedBox(height: 16),
          Text(
            '\u0644\u0627 \u062a\u0648\u062c\u062f \u0623\u0633\u0626\u0644\u0629 \u0645\u062d\u0641\u0648\u0638\u0629',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white.withOpacity(0.7),
              fontFamily: 'Cairo',
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '\u064a\u0645\u0643\u0646\u0643 \u062d\u0641\u0638 \u0627\u0644\u0623\u0633\u0626\u0644\u0629 \u0644\u0644\u0631\u062c\u0648\u0639 \u0625\u0644\u064a\u0647\u0627 \u0644\u0627\u062d\u0642\u0627\u064b',
            style: TextStyle(
              fontSize: 14,
              color: Colors.white.withOpacity(0.5),
              fontFamily: 'Cairo',
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () {
              _tabController.animateTo(0);
            },
            icon: const Icon(Icons.search),
            label: const Text(
                '\u0627\u0633\u062a\u0639\u0631\u0627\u0636 \u0628\u0646\u0648\u0643 \u0627\u0644\u0623\u0633\u0626\u0644\u0629',
                style: TextStyle(fontFamily: 'Cairo')),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primaryColor,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatisticsTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            '\u0625\u062d\u0635\u0627\u0626\u064a\u0627\u062a \u0627\u0644\u0623\u062f\u0627\u0621',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Cairo',
            ),
          ),
          const SizedBox(height: 24),

          // Overall performance card
          Card(
            color: const Color(0xFF2A2A2A),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '\u0627\u0644\u0623\u062f\u0627\u0621 \u0627\u0644\u0639\u0627\u0645',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      _buildStatItem(
                          '75%',
                          '\u0645\u062a\u0648\u0633\u0637 \u0627\u0644\u062f\u0631\u062c\u0627\u062a',
                          Icons.grade,
                          AppTheme.primaryColor),
                      _buildStatItem(
                          '120',
                          '\u0623\u0633\u0626\u0644\u0629 \u062a\u0645 \u062d\u0644\u0647\u0627',
                          Icons.check_circle,
                          AppTheme.secondaryColor),
                      _buildStatItem(
                          '8',
                          '\u0627\u062e\u062a\u0628\u0627\u0631\u0627\u062a \u0645\u0643\u062a\u0645\u0644\u0629',
                          Icons.assignment_turned_in,
                          AppTheme.warningColor),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    '\u062a\u0648\u0632\u064a\u0639 \u0627\u0644\u0625\u062c\u0627\u0628\u0627\u062a',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Cairo',
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        flex: 75,
                        child: Container(
                          height: 8,
                          decoration: BoxDecoration(
                            color: AppTheme.secondaryColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(4),
                              bottomLeft: Radius.circular(4),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 25,
                        child: Container(
                          height: 8,
                          decoration: BoxDecoration(
                            color: AppTheme.errorColor,
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(4),
                              bottomRight: Radius.circular(4),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: AppTheme.secondaryColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '\u0625\u062c\u0627\u0628\u0627\u062a \u0635\u062d\u064a\u062d\u0629 (75%)',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.7),
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: AppTheme.errorColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '\u0625\u062c\u0627\u0628\u0627\u062a \u062e\u0627\u0637\u0626\u0629 (25%)',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.7),
                              fontFamily: 'Cairo',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),
          const Text(
            '\u0623\u062f\u0627\u0621 \u0627\u0644\u0645\u0648\u0627\u062f',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontFamily: 'Cairo',
            ),
          ),
          const SizedBox(height: 16),

          // Subject performance cards
          Expanded(
            child: ListView(
              children: [
                _buildSubjectPerformanceCard(
                  '\u0623\u0633\u0627\u0633\u064a\u0627\u062a \u0627\u0644\u062a\u0645\u0631\u064a\u0636',
                  85,
                  60,
                  AppTheme.primaryColor,
                ),
                _buildSubjectPerformanceCard(
                  '\u0639\u0644\u0645 \u0627\u0644\u062a\u0634\u0631\u064a\u062d',
                  70,
                  40,
                  AppTheme.errorColor,
                ),
                _buildSubjectPerformanceCard(
                  '\u0645\u064a\u0643\u0631\u0648\u0628\u0627\u064a\u0648\u0644\u0648\u062c\u064a',
                  90,
                  20,
                  AppTheme.secondaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(
      String value, String label, IconData icon, Color color) {
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
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'Cairo',
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 12,
            color: Colors.white.withOpacity(0.7),
            fontFamily: 'Cairo',
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildSubjectPerformanceCard(
      String subject, int score, int questionsCount, Color color) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: const Color(0xFF2A2A2A),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subject,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Cairo',
                  ),
                ),
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '$score%',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: color,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              '\u0639\u062f\u062f \u0627\u0644\u0623\u0633\u0626\u0644\u0629 \u0627\u0644\u062a\u064a \u062a\u0645 \u062d\u0644\u0647\u0627: $questionsCount \u0633\u0624\u0627\u0644',
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.7),
                fontFamily: 'Cairo',
              ),
            ),
            const SizedBox(height: 8),
            ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: LinearProgressIndicator(
                value: score / 100,
                backgroundColor: Colors.white.withOpacity(0.1),
                valueColor: AlwaysStoppedAnimation<Color>(color),
                minHeight: 8,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getDifficultyColor(String difficulty) {
    switch (difficulty) {
      case '\u0633\u0647\u0644':
        return AppTheme.secondaryColor;
      case '\u0645\u062a\u0648\u0633\u0637':
        return AppTheme.warningColor;
      case '\u0635\u0639\u0628':
        return AppTheme.errorColor;
      default:
        return AppTheme.primaryColor;
    }
  }
}
