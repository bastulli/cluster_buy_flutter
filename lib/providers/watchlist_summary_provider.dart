// lib/providers/watchlist_summary_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';
import '../models/insider_trade_models.dart';
import 'insider_trade_providers.dart';
part 'watchlist_summary_provider.g.dart';

@riverpod
Future<WatchlistSummary> watchlistSummary(WatchlistSummaryRef ref) async {
  final watchlist = await ref.watch(watchlistNotifierProvider.future);
  final activeStocks =
      watchlist.where((stock) => stock.status == 'ACTIVE').toList();

  if (activeStocks.isEmpty) {
    return WatchlistSummary(
      totalStocks: watchlist.length,
      activeSignals: 0,
      averageReturn: 0,
      profitablePositions: 0,
      bestPerformer: 0,
      bestSymbol: '',
      totalValue: 0,
      sectorAllocation: {},
      lastUpdated: DateTime.now(),
    );
  }

  // Calculate statistics
  final profitablePositions =
      activeStocks.where((stock) => stock.priceChangePct > 0).length;

  final bestStock = activeStocks.reduce(
      (curr, next) => curr.priceChangePct > next.priceChangePct ? curr : next);

  final averageReturn =
      activeStocks.map((s) => s.priceChangePct).reduce((a, b) => a + b) /
          activeStocks.length;

  final totalValue =
      activeStocks.fold(0.0, (sum, stock) => sum + stock.currentPrice);

  // Calculate unrealized gains
  final unrealizedGain = activeStocks.fold(
    0.0,
    (sum, stock) =>
        sum +
        (stock.currentPrice - stock.insiderAvgPrice) *
            1, // Multiply by position size if available
  );

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

  return WatchlistSummary(
    totalStocks: watchlist.length,
    activeSignals: activeStocks.length,
    averageReturn: averageReturn,
    profitablePositions: profitablePositions,
    bestPerformer: bestStock.priceChangePct,
    bestSymbol: bestStock.symbol,
    totalValue: totalValue,
    realizedGain: 0, // This would come from transaction history if available
    unrealizedGain: unrealizedGain,
    sectorAllocation: {}, // This would come from sector data if available
    totalTransactions: activeStocks
        .map((s) => s.secFilingUrls?.length ?? 0)
        .fold(0, (a, b) => a + b),
    averageTransactionSize: totalValue / activeStocks.length,
    lastUpdated: DateTime.now(),
    topPerformers: topPerformers,
    recentlyAdded: recentlyAdded,
  );
}

// Helper providers for specific summary data
@riverpod
Future<List<String>> topPerformers(TopPerformersRef ref) async {
  final summary = await ref.watch(watchlistSummaryProvider.future);
  return summary.topPerformers;
}

@riverpod
Future<List<String>> recentlyAdded(RecentlyAddedRef ref) async {
  final summary = await ref.watch(watchlistSummaryProvider.future);
  return summary.recentlyAdded;
}

@riverpod
Future<Map<String, double>> performanceMetrics(
    PerformanceMetricsRef ref) async {
  final summary = await ref.watch(watchlistSummaryProvider.future);

  return {
    'averageReturn': summary.averageReturn,
    'bestPerformance': summary.bestPerformer,
    'realizedGain': summary.realizedGain,
    'unrealizedGain': summary.unrealizedGain,
  };
}

@riverpod
Future<Map<String, int>> activityMetrics(ActivityMetricsRef ref) async {
  final summary = await ref.watch(watchlistSummaryProvider.future);

  return {
    'totalStocks': summary.totalStocks,
    'activeSignals': summary.activeSignals,
    'profitablePositions': summary.profitablePositions,
    'totalTransactions': summary.totalTransactions,
  };
}
