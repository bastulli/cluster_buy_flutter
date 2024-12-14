// lib/providers/all_trade_stats_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/insider_trade_repository.dart';
import '../models/insider_trade_models.dart';

part 'all_trade_stats_provider.g.dart';

@riverpod
class AllTradeStats extends _$AllTradeStats {
  @override
  Future<Map<String, TradeStats>> build() async {
    return _fetchStats();
  }

  Future<Map<String, TradeStats>> _fetchStats() async {
    final repository = ref.read(insiderTradeRepositoryProvider);
    final stats = await repository.getAllTradeStats();

    // If we don't have any stats for the selected period, try previous days
    if (stats.isEmpty) {
      for (int i = 1; i <= 7; i++) {
        final date = DateTime.now().subtract(Duration(days: i));
        final previousStats = await repository.getAllTradeStats(
            date: date.toIso8601String().split('T')[0]);
        if (previousStats.isNotEmpty) {
          return previousStats;
        }
      }
    }

    return stats;
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
  }
}
