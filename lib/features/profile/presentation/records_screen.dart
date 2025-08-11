import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class RecordsScreen extends StatefulWidget {
  const RecordsScreen({super.key});

  @override
  State<RecordsScreen> createState() => _RecordsScreenState();
}

class _RecordsScreenState extends State<RecordsScreen> {
  final List<Map<String, dynamic>> records = [
    {
      'title':
          '\u0645\u062d\u0627\u0636\u0631\u0629 \u0623\u0633\u0627\u0633\u064a\u0627\u062a \u0627\u0644\u062a\u0645\u0631\u064a\u0636',
      'duration': '45:22',
      'date': '6 \u0623\u063a\u0633\u0637\u0633 2025',
      'isPlaying': false,
      'progress': 0.0,
    },
    {
      'title':
          '\u0645\u0631\u0627\u062c\u0639\u0629 \u0639\u0644\u0645 \u0627\u0644\u062a\u0634\u0631\u064a\u062d',
      'duration': '32:15',
      'date': '4 \u0623\u063a\u0633\u0637\u0633 2025',
      'isPlaying': false,
      'progress': 0.3,
    },
    {
      'title':
          '\u0634\u0631\u062d \u0645\u064a\u0643\u0631\u0648\u0628\u0627\u064a\u0648\u0644\u0648\u062c\u064a',
      'duration': '58:40',
      'date': '1 \u0623\u063a\u0633\u0637\u0633 2025',
      'isPlaying': false,
      'progress': 0.7,
    },
    {
      'title':
          '\u0645\u062d\u0627\u0636\u0631\u0629 \u0623\u062e\u0644\u0627\u0642\u064a\u0627\u062a \u0627\u0644\u062a\u0645\u0631\u064a\u0636',
      'duration': '37:10',
      'date': '29 \u064a\u0648\u0644\u064a\u0648 2025',
      'isPlaying': false,
      'progress': 0.0,
    },
    {
      'title':
          '\u0645\u0631\u0627\u062c\u0639\u0629 \u0639\u0644\u0645 \u0648\u0638\u0627\u0626\u0641 \u0627\u0644\u0623\u0639\u0636\u0627\u0621',
      'duration': '42:35',
      'date': '26 \u064a\u0648\u0644\u064a\u0648 2025',
      'isPlaying': false,
      'progress': 0.5,
    },
  ];

  int? currentlyPlayingIndex;

  void togglePlay(int index) {
    setState(() {
      if (currentlyPlayingIndex == index) {
        // Pause current
        records[index]['isPlaying'] = false;
        currentlyPlayingIndex = null;
      } else {
        // Pause previous if any
        if (currentlyPlayingIndex != null) {
          records[currentlyPlayingIndex!]['isPlaying'] = false;
        }
        // Play new
        records[index]['isPlaying'] = true;
        currentlyPlayingIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
              '\u0627\u0644\u0631\u064a\u0643\u0648\u0631\u062f\u0627\u062a',
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
                '\u062c\u0645\u064a\u0639 \u0627\u0644\u062a\u0633\u062c\u064a\u0644\u0627\u062a \u0627\u0644\u0635\u0648\u062a\u064a\u0629',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                itemCount: records.length,
                itemBuilder: (context, index) {
                  final record = records[index];
                  final isPlaying = record['isPlaying'] as bool;
                  final progress = record['progress'] as double;

                  return Card(
                    margin: const EdgeInsets.only(bottom: 16.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    color: const Color(0xFF2A2A2A),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      record['title'],
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
                                          record['date'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Colors.white.withOpacity(0.7),
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
                                          record['duration'],
                                          style: TextStyle(
                                            fontSize: 12,
                                            color:
                                                Colors.white.withOpacity(0.7),
                                            fontFamily: 'Cairo',
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () => togglePlay(index),
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: isPlaying
                                        ? AppTheme.primaryColor
                                        : AppTheme.primaryColor
                                            .withOpacity(0.2),
                                  ),
                                  child: Icon(
                                    isPlaying ? Icons.pause : Icons.play_arrow,
                                    color: isPlaying
                                        ? Colors.white
                                        : AppTheme.primaryColor,
                                    size: 30,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 12),
                          LinearProgressIndicator(
                            value: progress,
                            backgroundColor: Colors.white.withOpacity(0.1),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                AppTheme.primaryColor),
                            minHeight: 5,
                            borderRadius: BorderRadius.circular(2.5),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${(progress * double.parse(record['duration'].split(':')[0])).toStringAsFixed(2)}:${record['duration'].split(':')[1]}',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white.withOpacity(0.7),
                                  fontFamily: 'Cairo',
                                ),
                              ),
                              Text(
                                record['duration'],
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white.withOpacity(0.7),
                                  fontFamily: 'Cairo',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              IconButton(
                                icon: const Icon(Icons.replay_10,
                                    color: Colors.white70),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.skip_previous,
                                    color: Colors.white70),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.skip_next,
                                    color: Colors.white70),
                                onPressed: () {},
                              ),
                              IconButton(
                                icon: const Icon(Icons.forward_10,
                                    color: Colors.white70),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
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
          child: const Icon(Icons.mic),
        ),
      ),
    );
  }
}
