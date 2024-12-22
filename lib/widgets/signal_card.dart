// lib/widgets/signal_card.dart
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/insider_trade_models.dart';
import '../providers/price_history_provider.dart';
import 'stock_detail_sheet.dart';

class SignalCard extends ConsumerWidget {
  final WatchlistStock stock;
  final currencyFormatter =
      NumberFormat.currency(symbol: '\$', decimalDigits: 2);
  final compactFormatter = NumberFormat.compactCurrency(symbol: '\$');
  final dateFormatter = DateFormat('MMM d, y');

  SignalCard({
    super.key,
    required this.stock,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final isPositive = stock.priceChangePct >= 0;

    // Watch the PriceHistory provider with the stock's priceHistory data
    final priceSpots = ref.watch(priceHistoryProvider(stock.priceHistory));

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: InkWell(
        onTap: () => _showDetails(context),
        child: DefaultTextStyle.merge(
          style: const TextStyle(fontSize: 18), // Set a base font size
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(context, theme, isPositive, priceSpots),
              _buildAnalysis(context, theme),
              _buildMetrics(context, theme),
              if (stock.newsUrls?.isNotEmpty ?? false)
                _buildNewsSection(context, theme),
              _buildFooter(context, theme),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ThemeData theme, bool isPositive,
      List<FlSpot> priceSpots) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: isPositive
                ? theme.colorScheme.tertiary
                : theme.colorScheme.error,
            width: 4,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            stock.symbol,
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),
                          const SizedBox(width: 8),
                          _buildStatusChip(theme),
                          if (stock.keyFactors?.isNotEmpty ?? false) ...[
                            const SizedBox(width: 8),
                            _buildConfidenceChip(theme),
                          ],
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Added ${dateFormatter.format(stock.entryDate)}',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      currencyFormatter.format(stock.currentPrice),
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isPositive
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                          size: 16,
                          color: isPositive
                              ? theme.colorScheme.tertiary
                              : theme.colorScheme.error,
                        ),
                        Text(
                          '${stock.priceChangePct.abs().toStringAsFixed(1)}%',
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: isPositive
                                ? theme.colorScheme.tertiary
                                : theme.colorScheme.error,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 12),
            SizedBox(
              height: 60,
              child: _buildSparkline(theme, isPositive, priceSpots),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSparkline(
      ThemeData theme, bool isPositive, List<FlSpot> priceHistory) {
    final color =
        isPositive ? theme.colorScheme.tertiary : theme.colorScheme.error;

    if (priceHistory.isEmpty) {
      return const Center(child: Text("No Data"));
    }

    // Normalize x-values to start from 0
    double minX = priceHistory.map((spot) => spot.x).reduce(
        (value, element) => value < element ? value : element); // Find minX
    List<FlSpot> normalizedSpots = priceHistory.map((spot) {
      return FlSpot(spot.x - minX, spot.y);
    }).toList();

    // Determine min and max Y for scaling
    double minY =
        normalizedSpots.map((spot) => spot.y).reduce((a, b) => a < b ? a : b) *
            0.95;
    double maxY =
        normalizedSpots.map((spot) => spot.y).reduce((a, b) => a > b ? a : b) *
            1.05;

    // Find insider purchase spots based on dates from tradeDates
    List<FlSpot> insiderPurchaseSpots = [];
    if (stock.tradeDates != null && stock.tradeDates!.isNotEmpty) {
      for (var tradeDateString in stock.tradeDates!) {
        DateTime tradeDate = DateTime.parse(tradeDateString);

        // Find the corresponding price point for the trade's transaction date
        var pricePointIndex = stock.priceHistory.indexWhere((p) =>
            p.date.year == tradeDate.year &&
            p.date.month == tradeDate.month &&
            p.date.day == tradeDate.day);

        if (pricePointIndex != -1) {
          var pricePoint = stock.priceHistory[pricePointIndex];

          // Normalize the x-value of the insider purchase spot
          insiderPurchaseSpots.add(
            FlSpot(
                priceHistory[pricePointIndex].x - minX, // Normalize x-value
                pricePoint.price),
          );
        }
      }
    }

    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: false),
        titlesData: const FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        minX: 0,
        maxX: normalizedSpots.isNotEmpty
            ? normalizedSpots
                    .map((spot) => spot.x)
                    .reduce((a, b) => a > b ? a : b) +
                1
            : 1,
        minY: minY,
        maxY: maxY,
        lineBarsData: [
          LineChartBarData(
            spots: normalizedSpots,
            isCurved: true,
            color: color,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: FlDotData(
              show: true,
              getDotPainter: (spot, percent, barData, index) {
                // Highlight insider purchase spots
                if (insiderPurchaseSpots.any(
                    (s) => s.x.toInt() == spot.x.toInt() && s.y == spot.y)) {
                  return FlDotCirclePainter(
                    radius: 6,
                    color: theme.colorScheme.primary,
                    strokeColor: Colors.white,
                    strokeWidth: 2,
                  );
                } else {
                  return FlDotCirclePainter(
                    radius: 0,
                    color: Colors.transparent,
                    strokeColor: Colors.transparent,
                  );
                }
              },
            ),
            belowBarData: BarAreaData(
              show: true,
              color: color.withOpacity(0.1),
            ),
          ),
        ],
        lineTouchData: const LineTouchData(enabled: false),
      ),
    );
  }

  Widget _buildAnalysis(BuildContext context, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.analytics_outlined,
                size: 16,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'Analysis',
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            stock.analysisReasoning ?? 'N/A',
            style: theme.textTheme.bodyMedium,
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  Widget _buildMetrics(BuildContext context, ThemeData theme) {
    final avgPriceChange = ((stock.currentPrice - stock.insiderAvgPrice) /
        stock.insiderAvgPrice *
        100);
    final isPositiveAvgPrice = avgPriceChange >= 0;

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMetricItem(
                context,
                icon: Icons.price_change,
                label: 'Insider Avg Price',
                value: currencyFormatter.format(stock.insiderAvgPrice),
                secondaryValue:
                    '${avgPriceChange.abs().toStringAsFixed(1)}% ${isPositiveAvgPrice ? 'gain' : 'loss'}',
                isPositive: isPositiveAvgPrice,
              ),
              _buildMetricItem(
                context,
                icon: Icons.calendar_today,
                label: 'Days Since Purchase',
                value: stock.avgDaysSinceLastBuy.toString(),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Last updated: ${dateFormatter.format(stock.lastUpdated)}',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsSection(BuildContext context, ThemeData theme) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.article_outlined,
                size: 16,
                color: theme.colorScheme.primary,
              ),
              const SizedBox(width: 8),
              Text(
                'Recent News & Filings',
                style: theme.textTheme.titleSmall,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              ...(stock.newsUrls ?? []).take(2).map((url) {
                final uri = Uri.parse(url);
                return ActionChip(
                  avatar: const Icon(Icons.article, size: 16),
                  label: Text(
                    uri.host.replaceFirst('www.', ''),
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSecondaryContainer,
                    ),
                  ),
                  backgroundColor: theme.colorScheme.secondaryContainer,
                  onPressed: () => _launchURL(context, url),
                );
              }),
              if (stock.secFilingUrls?.isNotEmpty ?? false)
                ActionChip(
                  avatar: const Icon(Icons.description, size: 16),
                  label: Text(
                    '${stock.secFilingUrls!.length} SEC ${stock.secFilingUrls!.length == 1 ? 'Filing' : 'Filings'}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onTertiaryContainer,
                    ),
                  ),
                  backgroundColor: theme.colorScheme.tertiaryContainer,
                  onPressed: () {
                    // Directly open the SEC Filings tab in the bottom sheet
                    _showDetails(context, initialTabIndex: 2);
                  },
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(BuildContext context, ThemeData theme) {
    if ((stock.keyFactors?.isEmpty ?? true) &&
        (stock.secFilingUrls?.isEmpty ?? true)) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: [
          ...(stock.keyFactors ?? []).map((factor) => Chip(
                label: Text(
                  factor,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                  ),
                ),
                backgroundColor: theme.colorScheme.surfaceContainerHighest,
              )),
        ],
      ),
    );
  }

  Widget _buildStatusChip(ThemeData theme) {
    final isActive = stock.status == 'ACTIVE';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isActive
            ? theme.colorScheme.tertiary.withOpacity(0.1)
            : theme.colorScheme.error.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        stock.status,
        style: theme.textTheme.bodySmall?.copyWith(
          color:
              isActive ? theme.colorScheme.tertiary : theme.colorScheme.error,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildConfidenceChip(ThemeData theme) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: theme.colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.verified,
            size: 14,
            color: theme.colorScheme.onPrimaryContainer,
          ),
          const SizedBox(width: 4),
          Text(
            'Strong Signal',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.onPrimaryContainer,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricItem(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
    String? secondaryValue,
    bool? isPositive,
  }) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 16,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        const SizedBox(width: 4),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
            Text(
              value,
              style: theme.textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            if (secondaryValue != null)
              Text(
                secondaryValue,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: isPositive != null
                      ? (isPositive
                          ? theme.colorScheme.tertiary
                          : theme.colorScheme.error)
                      : theme.colorScheme.onSurfaceVariant,
                ),
              ),
          ],
        ),
      ],
    );
  }

  void _showDetails(BuildContext context, {int initialTabIndex = 0}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => StockDetailSheet(
        stock: stock,
        initialTabIndex: initialTabIndex,
      ),
    );
  }

  void _launchURL(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Could not launch $url')),
      );
    }
  }
}
