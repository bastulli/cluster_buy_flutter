// lib/widgets/watchlist_summary_card.dart
import 'package:clusterbuy/providers/insider_trade_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import '../models/insider_trade_models.dart';

final class WatchlistMetrics {
  final int totalStocks;
  final int activeSignals;
  final double averageReturn;
  final int profitableCount;
  final double bestReturn;
  final String bestSymbol;
  final double totalValue;
  final double avgHoldingPeriod;
  final double winRate;

  WatchlistMetrics({
    required this.totalStocks,
    required this.activeSignals,
    required this.averageReturn,
    required this.profitableCount,
    required this.bestReturn,
    required this.bestSymbol,
    required this.totalValue,
    required this.avgHoldingPeriod,
    required this.winRate,
  });

  factory WatchlistMetrics.fromWatchlist(List<WatchlistStock> stocks) {
    if (stocks.isEmpty) {
      return WatchlistMetrics(
        totalStocks: 0,
        activeSignals: 0,
        averageReturn: 0,
        profitableCount: 0,
        bestReturn: 0,
        bestSymbol: '',
        totalValue: 0,
        avgHoldingPeriod: 0,
        winRate: 0,
      );
    }

    final activeStocks = stocks.where((s) => s.status == 'ACTIVE').toList();
    final profitable = activeStocks.where((s) => s.priceChangePct > 0).length;
    final bestStock = activeStocks
        .reduce((a, b) => a.priceChangePct > b.priceChangePct ? a : b);

    return WatchlistMetrics(
      totalStocks: stocks.length,
      activeSignals: activeStocks.length,
      averageReturn: activeStocks.isEmpty
          ? 0
          : activeStocks.map((s) => s.priceChangePct).reduce((a, b) => a + b) /
              activeStocks.length,
      profitableCount: profitable,
      bestReturn: bestStock.priceChangePct,
      bestSymbol: bestStock.symbol,
      totalValue: activeStocks.fold(0, (sum, s) => sum + s.currentPrice),
      avgHoldingPeriod: activeStocks.isEmpty
          ? 0
          : activeStocks.map((s) => s.daysWatched).reduce((a, b) => a + b) /
              activeStocks.length,
      winRate: activeStocks.isEmpty ? 0 : profitable / activeStocks.length,
    );
  }
}

class WatchlistSummaryCard extends ConsumerWidget {
  final currencyFormatter =
      NumberFormat.currency(symbol: '\$', decimalDigits: 2);
  final compactFormatter = NumberFormat.compactCurrency(symbol: '\$');
  final percentFormatter = NumberFormat.decimalPercentPattern(decimalDigits: 1);

  WatchlistSummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final watchlistAsync = ref.watch(watchlistNotifierProvider);
    final theme = Theme.of(context);

    return Card(
      child: watchlistAsync.when(
        data: (stocks) {
          final metrics = WatchlistMetrics.fromWatchlist(stocks);
          return _buildContent(context, metrics, theme);
        },
        loading: () => const _LoadingState(),
        error: (error, stack) => _ErrorState(error: error),
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    WatchlistMetrics metrics,
    ThemeData theme,
  ) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, theme),
          const SizedBox(height: 24),
          _buildMainMetrics(context, metrics, theme),
          const SizedBox(height: 24),
          _buildPerformanceIndicator(context, metrics, theme),
          const SizedBox(height: 24),
          _buildStatisticsGrid(context, metrics, theme),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ThemeData theme) {
    return Row(
      children: [
        Icon(Icons.analytics_outlined, color: theme.colorScheme.primary),
        const SizedBox(width: 8),
        Text(
          'Portfolio Overview',
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildMainMetrics(
    BuildContext context,
    WatchlistMetrics metrics,
    ThemeData theme,
  ) {
    return Row(
      children: [
        Expanded(
          child: _buildMetricCard(
            context,
            'Active Signals',
            metrics.activeSignals.toString(),
            'of ${metrics.totalStocks} total',
            Icons.track_changes,
            theme.colorScheme.primary,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: _buildMetricCard(
            context,
            'Win Rate',
            percentFormatter.format(metrics.winRate),
            '${metrics.profitableCount} profitable',
            Icons.emoji_events,
            theme.colorScheme.tertiary,
          ),
        ),
      ],
    );
  }

  Widget _buildMetricCard(
    BuildContext context,
    String title,
    String value,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: theme.colorScheme.outlineVariant,
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: color),
              const SizedBox(width: 8),
              Text(
                title,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.7),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: theme.textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPerformanceIndicator(
    BuildContext context,
    WatchlistMetrics metrics,
    ThemeData theme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Performance Metrics',
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _buildPerformanceMetric(
                context,
                'Average Return',
                metrics.averageReturn,
                theme,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildPerformanceMetric(
                context,
                'Best Performer',
                metrics.bestReturn,
                theme,
                subtitle: metrics.bestSymbol,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPerformanceMetric(
    BuildContext context,
    String label,
    double value,
    ThemeData theme, {
    String? subtitle,
  }) {
    final isPositive = value >= 0;
    final color =
        isPositive ? theme.colorScheme.tertiary : theme.colorScheme.error;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.onSurface.withOpacity(0.7),
          ),
        ),
        const SizedBox(height: 4),
        Row(
          children: [
            Icon(
              isPositive ? Icons.arrow_upward : Icons.arrow_downward,
              size: 16,
              color: color,
            ),
            const SizedBox(width: 4),
            Text(
              '${value.abs().toStringAsFixed(1)}%',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
          ],
        ),
        if (subtitle != null)
          Text(
            subtitle,
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.5),
            ),
          ),
      ],
    );
  }

  Widget _buildStatisticsGrid(
    BuildContext context,
    WatchlistMetrics metrics,
    ThemeData theme,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Additional Statistics',
          style: theme.textTheme.titleMedium,
        ),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          childAspectRatio: 2,
          children: [
            _buildStatItem(
              context,
              'Total Value',
              compactFormatter.format(metrics.totalValue),
              Icons.account_balance_wallet,
              theme,
            ),
            _buildStatItem(
              context,
              'Avg Holding Period',
              '${metrics.avgHoldingPeriod.toStringAsFixed(1)} days',
              Icons.timer,
              theme,
            ),
            _buildStatItem(
              context,
              'Active Rate',
              percentFormatter
                  .format(metrics.activeSignals / metrics.totalStocks),
              Icons.trending_up,
              theme,
            ),
            _buildStatItem(
              context,
              'Success Rate',
              percentFormatter.format(metrics.winRate),
              Icons.verified,
              theme,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildStatItem(
    BuildContext context,
    String label,
    String value,
    IconData icon,
    ThemeData theme,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 16,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                label,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadingState extends StatelessWidget {
  const _LoadingState();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(32),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _ErrorState extends StatelessWidget {
  final Object error;

  const _ErrorState({required this.error});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error_outline, color: Colors.red, size: 48),
          const SizedBox(height: 16),
          Text(
            'Error loading summary',
            style: theme.textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          Text(
            error.toString(),
            style: theme.textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
