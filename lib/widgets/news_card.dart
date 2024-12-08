// lib/widgets/news_card.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCard extends StatelessWidget {
  final String symbol;
  final List<String> newsSources;
  final String? analysis;

  const NewsCard({
    super.key,
    required this.symbol,
    required this.newsSources,
    this.analysis,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.article, color: theme.colorScheme.primary),
                const SizedBox(width: 8),
                Text(
                  symbol,
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            if (analysis != null) ...[
              const SizedBox(height: 12),
              Text(
                'Analysis',
                style: theme.textTheme.titleSmall,
              ),
              const SizedBox(height: 4),
              Text(
                analysis!,
                style: theme.textTheme.bodyMedium,
              ),
            ],
            const SizedBox(height: 12),
            Text(
              'News Sources',
              style: theme.textTheme.titleSmall,
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: newsSources.map((url) {
                final uri = Uri.parse(url);
                return ActionChip(
                  avatar: const Icon(Icons.link, size: 16),
                  label: Text(uri.host),
                  onPressed: () => launchUrl(uri),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
