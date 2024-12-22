// lib/screens/metrics_screen.dart
import 'package:clusterbuy/models/insider_trade_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/all_trade_stats_provider.dart';
import '../widgets/metrics_header.dart';

class MetricsScreen extends ConsumerWidget {
  const MetricsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allStatsAsync = ref.watch(allTradeStatsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Metrics'),
      ),
      body: allStatsAsync.when(
        data: (allStats) {
          if (allStats.isEmpty) {
            return const Center(child: Text('No data available.'));
          }

          return MetricsHeaderWrapper(allTradeStats: allStats);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

class MetricsHeaderWrapper extends ConsumerWidget {
  final Map<String, TradeStats> allTradeStats;

  const MetricsHeaderWrapper({
    super.key,
    required this.allTradeStats,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MetricsHeader();
  }
}
