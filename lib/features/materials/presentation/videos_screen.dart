import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';

class VideosScreen extends StatefulWidget {
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  final List<Map<String, dynamic>> videos = [
    {
      'title':
          '\u0623\u0633\u0627\u0633\u064a\u0627\u062a \u0627\u0644\u062a\u0645\u0631\u064a\u0636 - \u0627\u0644\u0645\u062d\u0627\u0636\u0631\u0629 \u0627\u0644\u0623\u0648\u0644\u0649',
      'duration': '45:22',
      'instructor':
          '\u062f. \u0633\u0627\u0631\u0629 \u0645\u062d\u0645\u0648\u062f',
      'thumbnail': 'nursing_basics',
      'views': 1240,
      'date': '7 \u0623\u063a\u0633\u0637\u0633 2025',
      'progress': 0.0,
      'color': AppTheme.primaryColor,
    },
    {
      'title':
          '\u0639\u0644\u0645 \u0627\u0644\u062a\u0634\u0631\u064a\u062d - \u0627\u0644\u062c\u0647\u0627\u0632 \u0627\u0644\u0639\u0635\u0628\u064a',
      'duration': '38:15',
      'instructor': '\u062f. \u0623\u062d\u0645\u062f \u062e\u0627\u0644\u062f',
      'thumbnail': 'anatomy',
      'views': 980,
      'date': '5 \u0623\u063a\u0633\u0637\u0633 2025',
      'progress': 0.4,
      'color': AppTheme.errorColor,
    },
    {
      'title':
          '\u0645\u064a\u0643\u0631\u0648\u0628\u0627\u064a\u0648\u0644\u0648\u062c\u064a - \u0627\u0644\u0628\u0643\u062a\u064a\u0631\u064a\u0627 \u0648\u0627\u0644\u0641\u064a\u0631\u0648\u0633\u0627\u062a',
      'duration': '52:40',
      'instructor': '\u062f. \u0645\u062d\u0645\u062f \u0639\u0644\u064a',
      'thumbnail': 'microbiology',
      'views': 750,
      'date': '3 \u0623\u063a\u0633\u0637\u0633 2025',
      'progress': 0.8,
      'color': AppTheme.secondaryColor,
    },
    {
      'title':
          '\u0623\u062e\u0644\u0627\u0642\u064a\u0627\u062a \u0627\u0644\u062a\u0645\u0631\u064a\u0636 - \u062d\u0642\u0648\u0642 \u0627\u0644\u0645\u0631\u0636\u0649',
      'duration': '33:10',
      'instructor': '\u062f. \u0646\u0648\u0631\u0627 \u062d\u0633\u0646',
      'thumbnail': 'ethics',
      'views': 620,
      'date': '1 \u0623\u063a\u0633\u0637\u0633 2025',
      'progress': 0.2,
      'color': AppTheme.warningColor,
    },
    {
      'title':
          '\u0639\u0644\u0645 \u0648\u0638\u0627\u0626\u0641 \u0627\u0644\u0623\u0639\u0636\u0627\u0621 - \u0627\u0644\u0642\u0644\u0628 \u0648\u0627\u0644\u062f\u0648\u0631\u0629 \u0627\u0644\u062f\u0645\u0648\u064a\u0629',
      'duration': '48:35',
      'instructor':
          '\u062f. \u062e\u0627\u0644\u062f \u0625\u0628\u0631\u0627\u0647\u064a\u0645',
      'thumbnail': 'physiology',
      'views': 890,
      'date': '30 \u064a\u0648\u0644\u064a\u0648 2025',
      'progress': 0.6,
      'color': AppTheme.purpleColor,
    },
  ];

  bool _isGridView = true;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('\u0627\u0644\u0634\u0631\u0648\u062d\u0627\u062a',
              style: TextStyle(fontFamily: 'Cairo')),
          backgroundColor: AppTheme.surfaceColor,
          elevation: 0,
          actions: [
            IconButton(
              icon: Icon(_isGridView ? Icons.view_list : Icons.grid_view),
              onPressed: () {
                setState(() {
                  _isGridView = !_isGridView;
                });
              },
              tooltip: _isGridView
                  ? '\u0639\u0631\u0636 \u0642\u0627\u0626\u0645\u0629'
                  : '\u0639\u0631\u0636 \u0634\u0628\u0643\u0629',
            ),
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
                '\u062c\u0645\u064a\u0639 \u0627\u0644\u0641\u064a\u062f\u064a\u0648\u0647\u0627\u062a',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
            Expanded(
              child: _isGridView ? _buildGridView() : _buildListView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGridView() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16.0,
        mainAxisSpacing: 16.0,
        childAspectRatio: 0.75,
      ),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          color: const Color(0xFF2A2A2A),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Thumbnail with play button and duration
                Stack(
                  children: [
                    Container(
                      height: 120,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            video['color'],
                            video['color'].withOpacity(0.7),
                          ],
                        ),
                      ),
                      child: Center(
                        child: Icon(
                          Icons.play_circle_fill,
                          color: Colors.white.withOpacity(0.9),
                          size: 50,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 8,
                      right: 8,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: Text(
                          video['duration'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Cairo',
                          ),
                        ),
                      ),
                    ),
                    if (video['progress'] > 0)
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: LinearProgressIndicator(
                          value: video['progress'],
                          backgroundColor: Colors.white.withOpacity(0.3),
                          valueColor:
                              AlwaysStoppedAnimation<Color>(video['color']),
                          minHeight: 3,
                        ),
                      ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        video['title'],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontFamily: 'Cairo',
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        video['instructor'],
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white.withOpacity(0.7),
                          fontFamily: 'Cairo',
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.visibility,
                            size: 14,
                            color: Colors.white.withOpacity(0.7),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${video['views']} \u0645\u0634\u0627\u0647\u062f\u0629',
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
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListView() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 16.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          ),
          color: const Color(0xFF2A2A2A),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: () {},
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Thumbnail with play button and duration
                    Stack(
                      children: [
                        Container(
                          height: 100,
                          width: 150,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                video['color'],
                                video['color'].withOpacity(0.7),
                              ],
                            ),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.play_circle_fill,
                              color: Colors.white.withOpacity(0.9),
                              size: 40,
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          right: 8,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8.0,
                              vertical: 4.0,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Text(
                              video['duration'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontFamily: 'Cairo',
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              video['title'],
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontFamily: 'Cairo',
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              video['instructor'],
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.7),
                                fontFamily: 'Cairo',
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  Icons.visibility,
                                  size: 14,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  '${video['views']} \u0645\u0634\u0627\u0647\u062f\u0629',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white.withOpacity(0.7),
                                    fontFamily: 'Cairo',
                                  ),
                                ),
                                const SizedBox(width: 16),
                                Icon(
                                  Icons.calendar_today,
                                  size: 14,
                                  color: Colors.white.withOpacity(0.7),
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  video['date'],
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
                    ),
                  ],
                ),
                if (video['progress'] > 0)
                  LinearProgressIndicator(
                    value: video['progress'],
                    backgroundColor: Colors.white.withOpacity(0.3),
                    valueColor: AlwaysStoppedAnimation<Color>(video['color']),
                    minHeight: 3,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
