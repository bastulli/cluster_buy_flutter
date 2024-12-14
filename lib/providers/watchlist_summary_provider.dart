// lib/providers/watchlist_summary_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';
import '../models/insider_trade_models.dart';
import 'insider_trade_providers.dart';

part 'watchlist_summary_provider.g.dart';

@riverpod
Future<Map<String, dynamic>> watchlistSummary(WatchlistSummaryRef ref) async {
  final watchlist = await ref.watch(watchlistNotifierProvider.future);
  final activeStocks =
      watchlist.where((stock) => stock.status == 'ACTIVE').toList();

  if (activeStocks.isEmpty) {
    return {
      'totalStocks': watchlist.length,
      'activeSignals': 0,
      'averageReturn': 0.0,
      'profitablePositions': 0,
      'bestPerformer': 0.0,
      'bestSymbol': '',
      'totalValue': 0.0,
      'sectorAllocation': <String, double>{},
      'lastUpdated': DateTime.now(),
      'topPerformers': <String>[],
      'recentlyAdded': <String>[],
    };
  }

  // Calculate statistics
  final profitablePositions =
      activeStocks.where((stock) => stock.priceChangePct > 0).length;
  final bestStock = activeStocks.reduce(
      (curr, next) => curr.priceChangePct > next.priceChangePct ? curr : next);

  // Get recently added stocks (last 7 days)
  final sevenDaysAgo = DateTime.now().subtract(const Duration(days: 7));
  final recentlyAdded = activeStocks
      .where((stock) => stock.entryDate.isAfter(sevenDaysAgo))
      .map((stock) => stock.symbol)
      .toList();

  // Get top performers (top 5 by return)
  final topPerformers = List<String>.from(activeStocks
      .where((stock) => stock.priceChangePct > 0)
      .sorted((a, b) => b.priceChangePct.compareTo(a.priceChangePct))
      .take(5)
      .map((stock) => stock.symbol));

  return {
    'totalStocks': watchlist.length,
    'activeSignals': activeStocks.length,
    'averageReturn': activeStocks.isEmpty
        ? 0.0
        : activeStocks.map((s) => s.priceChangePct).reduce((a, b) => a + b) /
            activeStocks.length,
    'profitablePositions': profitablePositions,
    'bestPerformer': bestStock.priceChangePct,
    'bestSymbol': bestStock.symbol,
    'totalValue':
        activeStocks.fold(0.0, (sum, stock) => sum + stock.currentPrice),
    'sectorAllocation': <String, double>{}, // Add sector data if available
    'lastUpdated': DateTime.now(),
    'topPerformers': topPerformers,
    'recentlyAdded': recentlyAdded,
  };
}

// Helper providers for specific summary data
@riverpod
Future<List<String>> topPerformers(TopPerformersRef ref) async {
  final summary = await ref.watch(watchlistSummaryProvider.future);
  return List<String>.from(summary['topPerformers'] ?? []);
}

@riverpod
Future<List<String>> recentlyAdded(RecentlyAddedRef ref) async {
  final summary = await ref.watch(watchlistSummaryProvider.future);
  return List<String>.from(summary['recentlyAdded'] ?? []);
}

@riverpod
Future<Map<String, double>> performanceMetrics(
    PerformanceMetricsRef ref) async {
  final summary = await ref.watch(watchlistSummaryProvider.future);

  return {
    'averageReturn': summary['averageReturn'] ?? 0.0,
    'bestPerformance': summary['bestPerformer'] ?? 0.0,
  };
}

@riverpod
Future<Map<String, int>> activityMetrics(ActivityMetricsRef ref) async {
  final summary = await ref.watch(watchlistSummaryProvider.future);

  return {
    'totalStocks': summary['totalStocks'] ?? 0,
    'activeSignals': summary['activeSignals'] ?? 0,
    'profitablePositions': summary['profitablePositions'] ?? 0,
  };
}
