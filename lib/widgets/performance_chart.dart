// lib/widgets/performance_chart.dart
import 'package:clusterbuy/providers/insider_trade_providers.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/insider_trade_models.dart';

class PerformanceChart extends ConsumerStatefulWidget {
  const PerformanceChart({super.key});

  @override
  ConsumerState<PerformanceChart> createState() => _PerformanceChartState();
}

class _PerformanceChartState extends ConsumerState<PerformanceChart> {
  String _timeRange = '1W'; // Default to 1 week

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final watchlistAsync = ref.watch(watchlistNotifierProvider);
    final width = MediaQuery.of(context).size.width;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Performance Overview',
                    style: theme.textTheme.titleMedium,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                _buildTimeRangeSelector(width),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              height: 200,
              child: watchlistAsync.when(
                data: (stocks) => _buildChart(stocks, theme),
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (e, st) => Center(child: Text('Error: $e')),
              ),
            ),
            const SizedBox(height: 16),
            _buildLegend(theme),
          ],
        ),
      ),
    );
  }

  Widget _buildTimeRangeSelector(double screenWidth) {
    // For very narrow screens, use IconButtons instead
    if (screenWidth < 350) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildTimeRangeButton('1W'),
          _buildTimeRangeButton('1M'),
          _buildTimeRangeButton('3M'),
          _buildTimeRangeButton('ALL'),
        ],
      );
    }

    // For wider screens, use SegmentedButton
    return SegmentedButton<String>(
      segments: const [
        ButtonSegment<String>(value: '1W', label: Text('1W')),
        ButtonSegment<String>(value: '1M', label: Text('1M')),
        ButtonSegment<String>(value: '3M', label: Text('3M')),
        ButtonSegment<String>(value: 'ALL', label: Text('ALL')),
      ],
      selected: {_timeRange},
      onSelectionChanged: (Set<String> newSelection) {
        setState(() {
          _timeRange = newSelection.first;
        });
      },
      style: const ButtonStyle(
        visualDensity: VisualDensity.compact,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
    );
  }

  Widget _buildTimeRangeButton(String value) {
    final isSelected = _timeRange == value;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: IconButton(
        onPressed: () {
          setState(() {
            _timeRange = value;
          });
        },
        style: IconButton.styleFrom(
          backgroundColor:
              isSelected ? Theme.of(context).colorScheme.primary : null,
          padding: const EdgeInsets.all(4),
          minimumSize: const Size(28, 28),
        ),
        icon: Text(
          value,
          style: TextStyle(
            fontSize: 12,
            color: isSelected
                ? Colors.white
                : Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }

  Widget _buildChart(List<WatchlistStock> stocks, ThemeData theme) {
    final spots = _getSpots(stocks);

    return LineChart(
      LineChartData(
        gridData: const FlGridData(show: true),
        titlesData: FlTitlesData(
          leftTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 10,
              reservedSize: 40,
              getTitlesWidget: (value, meta) => Text(
                '${value.toInt()}%',
                style: theme.textTheme.bodySmall,
              ),
            ),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              interval: 1,
              getTitlesWidget: (value, meta) => Text(
                _getDateLabel(value.toInt()),
                style: theme.textTheme.bodySmall,
              ),
            ),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
        ),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            color: theme.colorScheme.primary,
            barWidth: 2,
            isStrokeCapRound: true,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              color: theme.colorScheme.primary.withOpacity(0.1),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLegend(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.circle, size: 12, color: theme.colorScheme.primary),
        const SizedBox(width: 8),
        Text(
          'Portfolio Performance',
          style: theme.textTheme.bodySmall,
        ),
      ],
    );
  }

  List<FlSpot> _getSpots(List<WatchlistStock> stocks) {
    // Convert your data to spots based on _timeRange
    // This is a placeholder implementation
    return List.generate(10, (i) {
      return FlSpot(i.toDouble(), (i * 2).toDouble());
    });
  }

  String _getDateLabel(int index) {
    // Convert index to date label based on _timeRange
    // This is a placeholder implementation
    return '$index/12';
  }
}
