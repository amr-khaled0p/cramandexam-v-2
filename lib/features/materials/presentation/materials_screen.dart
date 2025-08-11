import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import 'material_detail_screen.dart';

class MaterialsScreen extends StatefulWidget {
  const MaterialsScreen({super.key});

  @override
  State<MaterialsScreen> createState() => _MaterialsScreenState();
}

class _MaterialsScreenState extends State<MaterialsScreen> {
  // Updated list of subjects according to requirements
  final List<Map<String, dynamic>> materials = const [
    {
      'title':
          '\u0623\u0633\u0627\u0633\u064a\u0627\u062a \u0627\u0644\u062a\u0645\u0631\u064a\u0636 \u0646\u0638\u0631\u064a',
      'resources': {
        '\u0645\u0644\u062e\u0635\u0627\u062a': 5,
        '\u0641\u064a\u062f\u064a\u0648\u0647\u0627\u062a': 8,
        '\u0627\u062e\u062a\u0628\u0627\u0631\u0627\u062a': 3
      },
      'progress': 0.65,
      'color': AppTheme.primaryColor,
    },
    {
      'title':
          '\u0623\u0633\u0627\u0633\u064a\u0627\u062a \u062a\u0645\u0631\u064a\u0636 \u0639\u0645\u0644\u064a',
      'resources': {
        '\u0645\u0644\u062e\u0635\u0627\u062a': 3,
        '\u0641\u064a\u062f\u064a\u0648\u0647\u0627\u062a': 12,
        '\u0627\u062e\u062a\u0628\u0627\u0631\u0627\u062a': 4
      },
      'progress': 0.42,
      'color': AppTheme.secondaryColor,
    },
    {
      'title': '\u0639\u0644\u0645 \u0627\u0644\u062a\u0634\u0631\u064a\u062d',
      'resources': {
        '\u0645\u0644\u062e\u0635\u0627\u062a': 7,
        '\u0641\u064a\u062f\u064a\u0648\u0647\u0627\u062a': 10,
        '\u0627\u062e\u062a\u0628\u0627\u0631\u0627\u062a': 5
      },
      'progress': 0.78,
      'color': AppTheme.errorColor,
    },
    {
      'title':
          '\u0645\u064a\u0643\u0631\u0648\u0628\u0627\u064a\u0648\u0644\u0648\u062c\u064a',
      'resources': {
        '\u0645\u0644\u062e\u0635\u0627\u062a': 4,
        '\u0641\u064a\u062f\u064a\u0648\u0647\u0627\u062a': 6,
        '\u0627\u062e\u062a\u0628\u0627\u0631\u0627\u062a': 2
      },
      'progress': 0.25,
      'color': AppTheme.warningColor,
    },
    {
      'title':
          '\u0643\u064a\u0645\u064a\u0627\u0621 \u062d\u064a\u0648\u064a\u0629',
      'resources': {
        '\u0645\u0644\u062e\u0635\u0627\u062a': 6,
        '\u0641\u064a\u062f\u064a\u0648\u0647\u0627\u062a': 7,
        '\u0627\u062e\u062a\u0628\u0627\u0631\u0627\u062a': 3
      },
      'progress': 0.0,
      'color': AppTheme.purpleColor,
    },
    {
      'title':
          '\u0623\u062e\u0644\u0627\u0642\u064a\u0627\u062a \u0627\u0644\u062a\u0645\u0631\u064a\u0636',
      'resources': {
        '\u0645\u0644\u062e\u0635\u0627\u062a': 2,
        '\u0641\u064a\u062f\u064a\u0648\u0647\u0627\u062a': 5,
        '\u0627\u062e\u062a\u0628\u0627\u0631\u0627\u062a': 1
      },
      'progress': 0.0,
      'color': Color(0xFF9C27B0),
    },
    {
      'title':
          '\u0639\u0644\u0645 \u0648\u0638\u0627\u0626\u0641 \u0627\u0644\u0623\u0639\u0636\u0627\u0621',
      'resources': {
        '\u0645\u0644\u062e\u0635\u0627\u062a': 8,
        '\u0641\u064a\u062f\u064a\u0648\u0647\u0627\u062a': 9,
        '\u0627\u062e\u062a\u0628\u0627\u0631\u0627\u062a': 4
      },
      'progress': 0.0,
      'color': Color(0xFF00BCD4),
    },
    {
      'title': '\u0627\u0646\u062c\u0644\u064a\u0632\u064a 1',
      'resources': {
        '\u0645\u0644\u062e\u0635\u0627\u062a': 3,
        '\u0641\u064a\u062f\u064a\u0648\u0647\u0627\u062a': 4,
        '\u0627\u062e\u062a\u0628\u0627\u0631\u0627\u062a': 2
      },
      'progress': 0.0,
      'color': Color(0xFF4CAF50),
    },
  ];

  final List<Map<String, dynamic>> categories = const [
    {'name': '\u0627\u0644\u0643\u0644', 'isSelected': true},
    {'name': '\u062a\u0634\u0631\u064a\u062d', 'isSelected': false},
    {'name': '\u062a\u0645\u0631\u064a\u0636', 'isSelected': false},
    {
      'name': '\u0639\u0644\u0648\u0645 \u0637\u0628\u064a\u0629',
      'isSelected': false
    },
    {'name': '\u0644\u063a\u0627\u062a', 'isSelected': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
              "\u0627\u0644\u0645\u0648\u0627\u062f \u0627\u0644\u062f\u0631\u0627\u0633\u064a\u0629",
              style: TextStyle(fontFamily: 'Cairo')),
          backgroundColor: AppTheme.surfaceColor,
          elevation: 0,
          actions: [
            IconButton(
              icon: const Icon(Icons.filter_list),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {},
            ),
          ],
        ),
        body: Column(
          children: [
            // Categories
            SizedBox(
              height: 50,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(left: 8),
                    child: FilterChip(
                      label: Text(categories[index]['name'],
                          style: const TextStyle(fontFamily: 'Cairo')),
                      selected: categories[index]['isSelected'],
                      onSelected: (bool selected) {
                        setState(() {
                          for (var i = 0; i < categories.length; i++) {
                            categories[i] = {
                              ...categories[i],
                              'isSelected': i == index
                            };
                          }
                        });
                      },
                      backgroundColor: const Color(0xFF2A2A2A),
                      selectedColor: AppTheme.primaryColor,
                      checkmarkColor: Colors.white,
                      labelStyle: TextStyle(
                        color: categories[index]['isSelected']
                            ? Colors.white
                            : Colors.white70,
                        fontFamily: 'Cairo',
                      ),
                    ),
                  );
                },
              ),
            ),

            // Materials List
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: materials.length,
                itemBuilder: (context, index) {
                  final material = materials[index];
                  final materialColor = material['color'] as Color;
                  final hasProgress = material['progress'] > 0.0;

                  return Container(
                    margin: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: const Color(0xFF2A2A2A),
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Course Header with Color
                        Container(
                          height: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                materialColor,
                                materialColor.withOpacity(0.7),
                              ],
                            ),
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(16),
                              topRight: Radius.circular(16),
                            ),
                          ),
                          child: Stack(
                            children: [
                              const Positioned(
                                right: -30,
                                bottom: -30,
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
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      material['title'],
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontFamily: 'Cairo',
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    // Resource counts
                                    Row(
                                      children: [
                                        _buildResourceChip(
                                          '${material['resources']['\u0645\u0644\u062e\u0635\u0627\u062a']} \u0645\u0644\u062e\u0635\u0627\u062a',
                                          Icons.description,
                                        ),
                                        const SizedBox(width: 8),
                                        _buildResourceChip(
                                          '${material['resources']['\u0641\u064a\u062f\u064a\u0648\u0647\u0627\u062a']} \u0641\u064a\u062f\u064a\u0648\u0647\u0627\u062a',
                                          Icons.video_library,
                                        ),
                                        const SizedBox(width: 8),
                                        _buildResourceChip(
                                          '${material['resources']['\u0627\u062e\u062a\u0628\u0627\u0631\u0627\u062a']} \u0627\u062e\u062a\u0628\u0627\u0631\u0627\u062a',
                                          Icons.quiz,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Progress indicator if started
                        if (hasProgress)
                          LinearProgressIndicator(
                            value: material['progress'],
                            backgroundColor: Colors.white10,
                            valueColor:
                                AlwaysStoppedAnimation<Color>(materialColor),
                            minHeight: 5,
                          ),

                        // Course Actions
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Row(
                            children: [
                              // Bookmark button
                              IconButton(
                                icon: const Icon(
                                  Icons.bookmark_border,
                                  color: Colors.white70,
                                ),
                                onPressed: () {},
                              ),
                              const SizedBox(width: 8),
                              // View button
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => MaterialDetailScreen(
                                          subject: material['title'],
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: materialColor,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  icon: const Icon(Icons.visibility),
                                  label: const Text(
                                      "\u0639\u0631\u0636 \u0627\u0644\u0645\u0627\u062f\u0629",
                                      style: TextStyle(fontFamily: 'Cairo')),
                                ),
                              ),
                              const SizedBox(width: 8),
                              // Start studying button
                              Expanded(
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => MaterialDetailScreen(
                                          subject: material['title'],
                                        ),
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: hasProgress
                                        ? Colors.white24
                                        : materialColor,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 12),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  icon: Icon(
                                    hasProgress
                                        ? Icons.play_arrow
                                        : Icons.school,
                                  ),
                                  label: Text(
                                    hasProgress
                                        ? "\u0645\u062a\u0627\u0628\u0639\u0629"
                                        : "\u0628\u062f\u0621 \u0627\u0644\u062f\u0631\u0627\u0633\u0629",
                                    style: const TextStyle(fontFamily: 'Cairo'),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildResourceChip(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black26,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 14,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Cairo',
            ),
          ),
        ],
      ),
    );
  }
}
