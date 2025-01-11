// lib/widgets/metrics_header.dart
import 'package:clusterbuy/providers/all_trade_stats_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/insider_trade_models.dart';
import '../providers/insider_trade_providers.dart';

class MetricsHeader extends ConsumerWidget {
  const MetricsHeader({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final statsAsync = ref.watch(allTradeStatsProvider);
    final selectedPeriod = ref.watch(selectedPeriodProvider);

    return statsAsync.when(
      data: (stats) {
        if (!stats.containsKey(selectedPeriod)) {
          return _buildNoPeriodDataCard(context, stats.keys.toList(), ref);
        }

        final currentStats = stats[selectedPeriod]!;
        return Column(
          children: [
            _buildPeriodSelector(
                context, stats.keys.toList(), selectedPeriod, ref),
            const SizedBox(height: 16),
            _buildMainMetrics(context, currentStats),
            const SizedBox(height: 16),
            _buildVolumeBreakdown(context, currentStats),
            if (currentStats.topBuySymbols.isNotEmpty ||
                currentStats.topSellSymbols.isNotEmpty) ...[
              const SizedBox(height: 16),
              _buildTopActivities(context, currentStats),
            ],
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => _buildErrorCard(context, error, ref),
    );
  }

  Widget _buildPeriodSelector(
    BuildContext context,
    List<String> availablePeriods,
    String selectedPeriod,
    WidgetRef ref,
  ) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withOpacity(0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.insights,
                  color: theme.colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Insider Trading Activity',
                    style: theme.textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: 300,
                child: SegmentedButton<String>(
                  segments: [
                    ButtonSegment(
                      value: 'weekly',
                      label: const Text('Weekly'),
                      enabled: availablePeriods.contains('weekly'),
                    ),
                    ButtonSegment(
                      value: 'monthly',
                      label: const Text('Monthly'),
                      enabled: availablePeriods.contains('monthly'),
                    ),
                  ],
                  selected: {selectedPeriod},
                  onSelectionChanged: (values) {
                    if (values.first != selectedPeriod) {
                      ref
                          .read(selectedPeriodProvider.notifier)
                          .setPeriod(values.first);
                    }
                  },
                  style: ButtonStyle(
                    side: WidgetStateProperty.all(BorderSide(
                      color: theme.colorScheme.primary.withOpacity(0.2),
                    )),
                    fixedSize:
                        WidgetStateProperty.all(const Size.fromHeight(40)),
                    padding: WidgetStateProperty.all(EdgeInsets.zero),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainMetrics(BuildContext context, TradeStats stats) {
    final theme = Theme.of(context);
    final currencyFormatter = NumberFormat.compactCurrency(symbol: '\$');
    final buyRatio = stats.buyCount / (stats.buyCount + stats.sellCount);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withOpacity(0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Overview',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _buildMetricTile(
                    context,
                    'Total Volume',
                    currencyFormatter
                        .format(stats.totalBuyValue + stats.totalSellValue),
                    '${NumberFormat.compact().format(stats.totalTrades)} trades',
                    Icons.analytics,
                    theme.colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: _buildMetricTile(
                    context,
                    'Buy/Sell Ratio',
                    '${(buyRatio * 100).toStringAsFixed(1)}%',
                    _getBuySignalStrength(buyRatio),
                    Icons.compare_arrows,
                    _getBuySignalColor(buyRatio, theme),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildVolumeBreakdown(BuildContext context, TradeStats stats) {
    final theme = Theme.of(context);
    final currencyFormatter = NumberFormat.compactCurrency(symbol: '\$');

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withOpacity(0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.show_chart,
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Volume Breakdown',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: _buildVolumeCard(
                      context,
                      'Buy Volume',
                      stats.totalBuyValue,
                      stats.buyCount,
                      theme.colorScheme.tertiary,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: _buildVolumeCard(
                      context,
                      'Sell Volume',
                      stats.totalSellValue,
                      stats.sellCount,
                      theme.colorScheme.error,
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

  Widget _buildTopActivities(BuildContext context, TradeStats stats) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withOpacity(0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.trending_up,
                  size: 20,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 8),
                Text(
                  'Top Activity',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (stats.topBuySymbols.isNotEmpty)
                  Expanded(
                    child: _buildSymbolList(
                      context,
                      'Top Buys',
                      stats.topBuySymbols,
                      theme.colorScheme.tertiary,
                    ),
                  ),
                if (stats.topBuySymbols.isNotEmpty &&
                    stats.topSellSymbols.isNotEmpty)
                  const SizedBox(width: 20),
                if (stats.topSellSymbols.isNotEmpty)
                  Expanded(
                    child: _buildSymbolList(
                      context,
                      'Top Sells',
                      stats.topSellSymbols,
                      theme.colorScheme.error,
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMetricTile(
    BuildContext context,
    String label,
    String value,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outlineVariant.withOpacity(0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 18, color: color),
              const SizedBox(width: 8),
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            subtitle,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurfaceVariant,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildVolumeCard(
    BuildContext context,
    String label,
    double value,
    int count,
    Color color,
  ) {
    final theme = Theme.of(context);
    final formatter = NumberFormat.compactCurrency(symbol: '\$');

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: color.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: theme.textTheme.titleSmall?.copyWith(
              color: color,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            formatter.format(value),
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          Text(
            '${NumberFormat.compact().format(count)} transactions',
            style: theme.textTheme.bodySmall?.copyWith(
              color: color.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSymbolList(
    BuildContext context,
    String title,
    List<Map<String, dynamic>> symbols,
    Color color,
  ) {
    final theme = Theme.of(context);
    final formatter = NumberFormat.compactCurrency(symbol: '\$');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: theme.textTheme.titleSmall?.copyWith(
            color: theme.colorScheme.onSurface.withOpacity(0.7),
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 12),
        ...symbols.take(5).map((symbol) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: InkWell(
                onTap: () {
                  // Open Yahoo Finance for the symbol
                  final symbolStr = symbol['symbol'] as String;
                  final url = 'https://finance.yahoo.com/quote/$symbolStr';
                  launchUrl(Uri.parse(url));
                },
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      Text(
                        symbol['symbol'] ?? '',
                        style: theme.textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        formatter.format(symbol['total_value'] ?? 0),
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: color,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }

  Widget _buildNoPeriodDataCard(
    BuildContext context,
    List<String> availablePeriods,
    WidgetRef ref,
  ) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: theme.colorScheme.outlineVariant.withOpacity(0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.primary.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.info_outline,
                size: 32,
                color: theme.colorScheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'No Data Available',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            if (availablePeriods.isNotEmpty) ...[
              Text(
                'Data is available for these periods:',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.center,
                children: availablePeriods
                    .map((period) => ActionChip(
                          avatar: Icon(
                            _getPeriodIcon(period),
                            size: 18,
                            color: theme.colorScheme.primary,
                          ),
                          label: Text(period.capitalize()),
                          labelStyle: TextStyle(
                            color: theme.colorScheme.primary,
                          ),
                          backgroundColor: theme.colorScheme.primaryContainer
                              .withOpacity(0.3),
                          onPressed: () {
                            ref
                                .read(selectedPeriodProvider.notifier)
                                .setPeriod(period);
                          },
                        ))
                    .toList(),
              ),
            ] else
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  'No trading statistics are available for any period at this time.',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            const SizedBox(height: 24),
            FilledButton.icon(
              onPressed: () {
                ref.read(allTradeStatsProvider.notifier).refresh();
              },
              icon: const Icon(Icons.refresh, size: 18),
              label: const Text('Refresh Data'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildErrorCard(BuildContext context, Object error, WidgetRef ref) {
    final theme = Theme.of(context);

    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: theme.colorScheme.error.withOpacity(0.5),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.error.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.error_outline,
                size: 32,
                color: theme.colorScheme.error,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Unable to Load Trading Statistics',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              error.toString(),
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            OutlinedButton.icon(
              onPressed: () {
                ref.read(allTradeStatsProvider.notifier).refresh();
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }

  String _getBuySignalStrength(double ratio) {
    if (ratio >= 0.7) return 'Strong buying pressure';
    if (ratio >= 0.6) return 'Moderate buying';
    if (ratio >= 0.4) return 'Neutral activity';
    if (ratio >= 0.3) return 'Moderate selling';
    return 'Strong selling pressure';
  }

  Color _getBuySignalColor(double ratio, ThemeData theme) {
    if (ratio >= 0.7) return theme.colorScheme.tertiary;
    if (ratio >= 0.6) return theme.colorScheme.tertiary.withOpacity(0.7);
    if (ratio >= 0.4) return theme.colorScheme.primary;
    if (ratio >= 0.3) return theme.colorScheme.error.withOpacity(0.7);
    return theme.colorScheme.error;
  }

  IconData _getPeriodIcon(String period) {
    switch (period) {
      case 'daily':
        return Icons.today;
      case 'weekly':
        return Icons.view_week;
      case 'monthly':
        return Icons.calendar_month;
      default:
        return Icons.access_time;
    }
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) return this;
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
