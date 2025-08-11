import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class SummariesScreen extends StatefulWidget {
  const SummariesScreen({super.key});

  @override
  State<SummariesScreen> createState() => _SummariesScreenState();
}

class _SummariesScreenState extends State<SummariesScreen> {
  final List<Map<String, dynamic>> summaries = [
    {
      'title':
          '\u0645\u0644\u062e\u0635 \u0623\u0633\u0627\u0633\u064a\u0627\u062a \u0627\u0644\u062a\u0645\u0631\u064a\u0636',
      'pages': 24,
      'date': '5 \u0623\u063a\u0633\u0637\u0633 2025',
      'color': AppTheme.primaryColor,
    },
    {
      'title':
          '\u0645\u0644\u062e\u0635 \u0639\u0644\u0645 \u0627\u0644\u062a\u0634\u0631\u064a\u062d',
      'pages': 32,
      'date': '2 \u0623\u063a\u0633\u0637\u0633 2025',
      'color': AppTheme.errorColor,
    },
    {
      'title':
          '\u0645\u0644\u062e\u0635 \u0645\u064a\u0643\u0631\u0648\u0628\u0627\u064a\u0648\u0644\u0648\u062c\u064a',
      'pages': 18,
      'date': '30 \u064a\u0648\u0644\u064a\u0648 2025',
      'color': AppTheme.secondaryColor,
    },
    {
      'title':
          '\u0645\u0644\u062e\u0635 \u0623\u062e\u0644\u0627\u0642\u064a\u0627\u062a \u0627\u0644\u062a\u0645\u0631\u064a\u0636',
      'pages': 15,
      'date': '28 \u064a\u0648\u0644\u064a\u0648 2025',
      'color': AppTheme.warningColor,
    },
    {
      'title':
          '\u0645\u0644\u062e\u0635 \u0639\u0644\u0645 \u0648\u0638\u0627\u0626\u0641 \u0627\u0644\u0623\u0639\u0636\u0627\u0621',
      'pages': 28,
      'date': '25 \u064a\u0648\u0644\u064a\u0648 2025',
      'color': AppTheme.purpleColor,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('\u0627\u0644\u0645\u0644\u062e\u0635\u0627\u062a',
              style: TextStyle(fontFamily: 'Cairo')),
          backgroundColor: AppTheme.surfaceColor,
          elevation: 0,
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                '\u062c\u0645\u064a\u0639 \u0627\u0644\u0645\u0644\u062e\u0635\u0627\u062a',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: summaries.length,
                itemBuilder: (context, index) {
                  final summary = summaries[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    color: const Color(0xFF2A2A2A),
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.circular(16.0),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            Container(
                              width: 60,
                              height: 80,
                              decoration: BoxDecoration(
                                color: summary['color'].withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(
                                  color: summary['color'],
                                  width: 2,
                                ),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.picture_as_pdf,
                                    color: summary['color'],
                                    size: 28,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'PDF',
                                    style: TextStyle(
                                      color: summary['color'],
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'Cairo',
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
                                    summary['title'],
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontFamily: 'Cairo',
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.calendar_today,
                                        size: 14,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        summary['date'],
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.white.withOpacity(0.7),
                                          fontFamily: 'Cairo',
                                        ),
                                      ),
                                      const SizedBox(width: 16),
                                      Icon(
                                        Icons.file_copy,
                                        size: 14,
                                        color: Colors.white.withOpacity(0.7),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        '${summary['pages']} \u0635\u0641\u062d\u0629',
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
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.download,
                                color: Colors.white70,
                              ),
                              onPressed: () {},
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
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppTheme.primaryColor,
          child: const Icon(Icons.add),
        ),
      ),
    );
  }
}
