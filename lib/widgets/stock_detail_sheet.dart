// lib/widgets/stock_detail_sheet.dart
import 'package:clusterbuy/models/insider_trade_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class StockDetailSheet extends ConsumerStatefulWidget {
  final WatchlistStock stock;
  final int initialTabIndex;

  const StockDetailSheet({
    super.key,
    required this.stock,
    this.initialTabIndex = 0,
  });

  @override
  ConsumerState<StockDetailSheet> createState() => _StockDetailSheetState();
}

class _StockDetailSheetState extends ConsumerState<StockDetailSheet>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final currencyFormatter =
      NumberFormat.currency(symbol: '\$', decimalDigits: 2);
  final percentFormatter = NumberFormat.decimalPercentPattern(decimalDigits: 1);
  final dateFormatter = DateFormat('MMM d, y');

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        length: 4, vsync: this, initialIndex: widget.initialTabIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return DraggableScrollableSheet(
      initialChildSize: 0.9,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
          ),
          child: Column(
            children: [
              _buildHeader(theme, context),
              TabBar(
                controller: _tabController,
                tabs: const [
                  Tab(text: 'Analysis'),
                  Tab(text: 'Metrics'),
                  Tab(text: 'SEC Links'),
                  Tab(text: 'News Links'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    _buildAnalysisTab(scrollController),
                    _buildMetricsTab(scrollController),
                    _buildSecLinksTab(scrollController),
                    _buildNewsLinksTab(scrollController),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildHeader(ThemeData theme, BuildContext context) {
    final isPositive = widget.stock.priceChangePct >= 0;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: theme.colorScheme.outlineVariant,
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  final symbol = widget.stock.symbol;
                  final url = 'https://finance.yahoo.com/quote/$symbol';
                  launchUrl(Uri.parse(url));
                },
                child: Row(
                  children: [
                    Text(
                      widget.stock.symbol,
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline, // Add underline
                      ),
                    ),
                    const SizedBox(width: 8),
                    _buildStatusChip(theme),
                    const SizedBox(width: 8), // Add some spacing
                    Icon(Icons.open_in_new,
                        size: 20, color: theme.colorScheme.primary),
                  ],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      currencyFormatter.format(widget.stock.currentPrice),
                      style: theme.textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(
                          isPositive
                              ? Icons.arrow_upward
                              : Icons.arrow_downward,
                          size: 18,
                          color: isPositive
                              ? theme.colorScheme.tertiary
                              : theme.colorScheme.error,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          '${widget.stock.priceChangePct.abs().toStringAsFixed(2)}%',
                          style: theme.textTheme.bodyLarge?.copyWith(
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
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOverviewTab(ScrollController scrollController) {
    final theme = Theme.of(context);
    final avgPriceDiff =
        ((widget.stock.currentPrice - widget.stock.insiderAvgPrice) /
            widget.stock.insiderAvgPrice *
            100);

    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      children: [
        _buildMetricSection(
          title: 'Performance Metrics',
          metrics: [
            _buildMetric(
              'Entry Price',
              currencyFormatter.format(widget.stock.insiderAvgPrice),
              Icons.price_change,
              subtitle: 'Insider average',
            ),
            _buildMetric(
              'Price Change',
              '${avgPriceDiff.toStringAsFixed(1)}%',
              Icons.trending_up,
              subtitle: 'From entry',
              color: avgPriceDiff >= 0
                  ? theme.colorScheme.tertiary
                  : theme.colorScheme.error,
            ),
            _buildMetric(
              'Days Tracked',
              widget.stock.daysWatched.toString(),
              Icons.calendar_today,
              subtitle: 'Since ${dateFormatter.format(widget.stock.entryDate)}',
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAnalysisTab(ScrollController scrollController) {
    final theme = Theme.of(context);

    // Combine Key Insights and Analysis Text into one string for copying
    String getCombinedText() {
      final keyInsights = widget.stock.keyFactors!.isNotEmpty
          ? widget.stock.keyFactors!.map((insight) => '- $insight').join('\n')
          : '';
      final analysis = widget.stock.analysisReasoning;
      return [
        if (keyInsights.isNotEmpty) 'Key Insights:\n$keyInsights',
        'Analysis:\n$analysis',
      ].join('\n\n');
    }

    return Column(
      children: [
        Expanded(
          child: ListView(
            controller: scrollController,
            padding: const EdgeInsets.all(16),
            children: [
              if (widget.stock.keyFactors!.isNotEmpty) ...[
                Text(
                  'Key Insights',
                  style: theme.textTheme.headlineSmall,
                ),
                const SizedBox(height: 8),
                ...widget.stock.keyFactors!.map((insight) => Text(
                      '- $insight',
                      style: theme.textTheme.bodyLarge,
                    )),
              ],
              const SizedBox(height: 24),
              Text(
                'Analysis',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                widget.stock.analysisReasoning ?? '',
                style: theme.textTheme.bodyLarge?.copyWith(
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton.icon(
            onPressed: () {
              Clipboard.setData(
                ClipboardData(text: getCombinedText()),
              );
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content:
                        Text('Insights and Analysis copied to clipboard!')),
              );
            },
            icon: const Icon(Icons.copy),
            label: const Text('Copy to Clipboard'),
          ),
        ),
      ],
    );
  }

  Widget _buildSecLinksTab(ScrollController scrollController) {
    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      children: widget.stock.secFilingUrls!
          .map((url) => _buildSourceLink(url, 'SEC Filing'))
          .toList(),
    );
  }

  Widget _buildNewsLinksTab(ScrollController scrollController) {
    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      children: widget.stock.newsUrls!
          .map((url) => _buildSourceLink(url, 'News'))
          .toList(),
    );
  }

  Widget _buildSourceLink(String url, String type) {
    final theme = Theme.of(context);
    final uri = Uri.parse(url);

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: ListTile(
        leading: Icon(
          type == 'SEC Filing' ? Icons.description : Icons.article,
          color: theme.colorScheme.primary,
        ),
        title: Text(
          uri.pathSegments.isNotEmpty
              ? uri.pathSegments.last.truncateWithEllipsis(30)
              : uri.host.truncateWithEllipsis(30),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: theme.textTheme.titleMedium,
        ),
        subtitle: Text(
          uri.host,
          style: theme.textTheme.bodyMedium,
        ),
        trailing: const Icon(Icons.open_in_new, size: 24),
        onTap: () async {
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          }
        },
      ),
    );
  }

  Widget _buildMetricsTab(ScrollController scrollController) {
    final theme = Theme.of(context);

    return ListView(
      controller: scrollController,
      padding: const EdgeInsets.all(16),
      children: [
        _buildMetricSection(
          title: 'Key Metrics',
          metrics: [
            _buildMetric(
              'Insider Avg Price',
              currencyFormatter.format(widget.stock.insiderAvgPrice),
              Icons.price_change,
            ),
            _buildMetric(
              'Current Price',
              currencyFormatter.format(widget.stock.currentPrice),
              Icons.attach_money,
            ),
            _buildMetric(
              'Price Change %',
              '${widget.stock.priceChangePct.toStringAsFixed(1)}%',
              Icons.trending_up, // You might want a different icon for down
              color: widget.stock.priceChangePct >= 0
                  ? theme.colorScheme.tertiary
                  : theme.colorScheme.error,
            ),
            _buildMetric(
              'Days Since Avg Purchase',
              widget.stock.avgDaysSinceLastBuy.toString(),
              Icons.calendar_today,
            ),
            _buildMetric(
              'Days Watched',
              widget.stock.daysWatched.toString(),
              Icons.visibility,
            ),
            // Add more metrics here if needed
          ],
        ),
        // You can add more sections with _buildMetricSection
      ],
    );
  }

  Widget _buildMetricSection({
    required String title,
    required List<Widget> metrics,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: metrics,
        ),
      ],
    );
  }

  Widget _buildMetric(
    String label,
    String value,
    IconData icon, {
    String? subtitle,
    Color? color,
  }) {
    final theme = Theme.of(context);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: color ?? theme.colorScheme.primary),
              const SizedBox(width: 8),
              Text(
                label,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant,
                ),
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
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: theme.textTheme.bodyMedium,
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildStatusChip(ThemeData theme) {
    final isActive = widget.stock.status == 'ACTIVE';
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: isActive
            ? theme.colorScheme.tertiary.withOpacity(0.1)
            : theme.colorScheme.error.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        widget.stock.status,
        style: theme.textTheme.bodyLarge?.copyWith(
          color:
              isActive ? theme.colorScheme.tertiary : theme.colorScheme.error,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

extension StringX on String {
  String truncateWithEllipsis(int maxLength) {
    if (length <= maxLength) return this;
    return '${substring(0, maxLength)}...';
  }
}
