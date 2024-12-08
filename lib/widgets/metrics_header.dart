// lib/widgets/metrics_header.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../models/insider_trade_models.dart';
import '../providers/insider_trade_providers.dart';

enum TimelinePeriod { daily, weekly, monthly }

class MetricsHeader extends ConsumerStatefulWidget {
  final TradeStats stats;

  const MetricsHeader({
    super.key,
    required this.stats,
  });

  @override
  ConsumerState<MetricsHeader> createState() => _MetricsHeaderState();
}

class _MetricsHeaderState extends ConsumerState<MetricsHeader> {
  final currencyFormatter = NumberFormat.currency(
    symbol: '\$',
    decimalDigits: 0,
    locale: 'en_US',
  );
  final compactFormatter = NumberFormat.compactCurrency(
    symbol: '\$',
    decimalDigits: 1,
  );
  final percentFormatter = NumberFormat.decimalPercentPattern(decimalDigits: 1);

  void _onPeriodChanged(Set<TimelinePeriod> selection) {
    final period = switch (selection.first) {
      TimelinePeriod.daily => 'daily',
      TimelinePeriod.weekly => 'weekly',
      TimelinePeriod.monthly => 'monthly'
    };
    ref.read(selectedPeriodProvider.notifier).setPeriod(period);
  }

  TimelinePeriod _getCurrentPeriod() {
    return switch (ref.watch(selectedPeriodProvider)) {
      'daily' => TimelinePeriod.daily,
      'weekly' => TimelinePeriod.weekly,
      'monthly' => TimelinePeriod.monthly,
      _ => TimelinePeriod.daily
    };
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTimelineHeader(context),
            const SizedBox(height: 24),
            _buildMainMetrics(theme),
            const SizedBox(height: 16),
            _buildVolumeMetrics(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildTimelineHeader(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _getHeaderTitle(),
                  style: theme.textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  _getDateRangeText(),
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        SegmentedButton<TimelinePeriod>(
          selected: {_getCurrentPeriod()},
          onSelectionChanged: _onPeriodChanged,
          segments: const [
            ButtonSegment<TimelinePeriod>(
              value: TimelinePeriod.daily,
              label: Text('Daily'),
            ),
            ButtonSegment<TimelinePeriod>(
              value: TimelinePeriod.weekly,
              label: Text('Weekly'),
            ),
            ButtonSegment<TimelinePeriod>(
              value: TimelinePeriod.monthly,
              label: Text('Monthly'),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildMainMetrics(ThemeData theme) {
    final buyRatio = widget.stats.totalTrades > 0
        ? widget.stats.buyCount / widget.stats.totalTrades
        : 0.0;

    return Row(
      children: [
        Expanded(
          child: _buildMetricCard(
            context: context,
            label: 'Buy Volume',
            value: compactFormatter.format(widget.stats.totalBuyValue),
            subtitle: '${widget.stats.buyCount} transactions',
            icon: Icons.trending_up,
            color: theme.colorScheme.tertiary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildMetricCard(
            context: context,
            label: 'Sell Volume',
            value: compactFormatter.format(widget.stats.totalSellValue),
            subtitle: '${widget.stats.sellCount} transactions',
            icon: Icons.trending_down,
            color: theme.colorScheme.error,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildMetricCard(
            context: context,
            label: 'Buy/Sell Ratio',
            value: percentFormatter.format(buyRatio),
            subtitle: _getBuySignalStrength(buyRatio),
            icon: Icons.compare_arrows,
            color: _getBuySignalColor(buyRatio, theme),
          ),
        ),
      ],
    );
  }

  Widget _buildVolumeMetrics(ThemeData theme) {
    final totalVolume =
        widget.stats.totalBuyValue + widget.stats.totalSellValue;
    final buyPercentage =
        totalVolume > 0 ? (widget.stats.totalBuyValue / totalVolume) : 0.0;

    return Tooltip(
      message:
          'Shows the distribution of insider trading volume between buys and sells. '
          'A higher percentage of buys may indicate positive insider sentiment, while more sells '
          'could suggest insiders taking profits or reducing positions.',
      textStyle: TextStyle(
        color: theme.colorScheme.onPrimary,
        fontSize: 14,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.9),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      preferBelow: true,
      waitDuration: const Duration(milliseconds: 500),
      showDuration: const Duration(seconds: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Volume Distribution',
                    style: theme.textTheme.titleSmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    Icons.info_outline,
                    size: 14,
                    color: theme.colorScheme.onSurfaceVariant.withOpacity(0.5),
                  ),
                ],
              ),
              Text(
                '${widget.stats.uniqueSymbols} companies',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: LinearProgressIndicator(
              value: buyPercentage,
              backgroundColor: theme.colorScheme.error.withOpacity(0.2),
              valueColor: AlwaysStoppedAnimation<Color>(
                theme.colorScheme.tertiary,
              ),
              minHeight: 8,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Buys ${(buyPercentage * 100).toStringAsFixed(1)}%',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.tertiary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Sells ${((1 - buyPercentage) * 100).toStringAsFixed(1)}%',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.error,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricCard({
    required BuildContext context,
    required String label,
    required String value,
    required String subtitle,
    required IconData icon,
    required Color color,
  }) {
    final theme = Theme.of(context);
    final tooltipText = _getTooltipText(label);

    return Tooltip(
      message: tooltipText,
      textStyle: TextStyle(
        color: theme.colorScheme.onPrimary,
        fontSize: 14,
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.9),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(12),
      preferBelow: true,
      waitDuration: const Duration(milliseconds: 500),
      showDuration: const Duration(seconds: 4),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: theme.colorScheme.surface,
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
                Icon(icon, size: 16, color: color),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                const SizedBox(width: 4),
                Icon(
                  Icons.info_outline,
                  size: 14,
                  color: theme.colorScheme.onSurfaceVariant.withOpacity(0.5),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getTooltipText(String label) {
    switch (label) {
      case 'Buy Volume':
        return 'Total value of insider purchase transactions in the selected period. '
            'High buy volume may indicate strong insider confidence in the company\'s future.';
      case 'Sell Volume':
        return 'Total value of insider sell transactions in the selected period. '
            'Selling can occur for various reasons including diversification or personal needs.';
      case 'Buy/Sell Ratio':
        return 'Percentage of total transactions that are buys. Values above 60% indicate moderate '
            'buying pressure, while above 70% suggests strong buying activity from insiders.';
      default:
        return '';
    }
  }

  String _getHeaderTitle() {
    final currentPeriod = _getCurrentPeriod();
    return switch (currentPeriod) {
      TimelinePeriod.daily => "Today's Activity",
      TimelinePeriod.weekly => "Weekly Activity",
      TimelinePeriod.monthly => "Monthly Activity"
    };
  }

  String _getDateRangeText() {
    final now = widget.stats.date;
    final currentPeriod = _getCurrentPeriod();

    return switch (currentPeriod) {
      TimelinePeriod.daily => DateFormat('EEEE, MMMM d').format(now),
      TimelinePeriod.weekly => () {
          final weekStart = now.subtract(Duration(days: now.weekday - 1));
          final weekEnd = weekStart.add(const Duration(days: 6));
          return '${DateFormat('MMM d').format(weekStart)} - ${DateFormat('MMM d').format(weekEnd)}';
        }(),
      TimelinePeriod.monthly => DateFormat('MMMM yyyy').format(now)
    };
  }

  String _getBuySignalStrength(double ratio) {
    if (ratio >= 0.7) return 'Strong buying';
    if (ratio >= 0.6) return 'Moderate buying';
    if (ratio >= 0.4) return 'Neutral';
    if (ratio >= 0.3) return 'Moderate selling';
    return 'Strong selling';
  }

  Color _getBuySignalColor(double ratio, ThemeData theme) {
    if (ratio >= 0.7) return theme.colorScheme.tertiary;
    if (ratio >= 0.6) return theme.colorScheme.tertiary.withOpacity(0.7);
    if (ratio >= 0.4) return theme.colorScheme.primary;
    if (ratio >= 0.3) return theme.colorScheme.error.withOpacity(0.7);
    return theme.colorScheme.error;
  }
}
