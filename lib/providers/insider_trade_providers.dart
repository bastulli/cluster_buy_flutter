// lib/providers/insider_trade_providers.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/insider_trade_repository.dart';
import 'package:collection/collection.dart';
import '../models/insider_trade_models.dart';
import 'dart:math';

part 'insider_trade_providers.g.dart';

@Riverpod(keepAlive: true)
class SelectedPeriod extends _$SelectedPeriod {
  @override
  String build() => 'weekly'; // Changed default from 'daily' to 'weekly'

  void setPeriod(String period) {
    if (period == 'weekly' || period == 'monthly') {
      state = period;
    }
  }
}

@Riverpod(keepAlive: true)
class WatchlistNotifier extends _$WatchlistNotifier {
  @override
  Future<List<WatchlistStock>> build() async {
    return _fetchWatchlist();
  }

  Future<List<WatchlistStock>> _fetchWatchlist() async {
    final repository = ref.read(insiderTradeRepositoryProvider);
    final watchlist = await repository.getWatchlist();

    return _sortByPerformance(watchlist);
  }

  List<WatchlistStock> _sortByPerformance(List<WatchlistStock> stocks) {
    return List<WatchlistStock>.from(stocks)
      ..sort((a, b) => b.priceChangePct.compareTo(a.priceChangePct));
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchWatchlist());
  }

  // Filter methods
  List<WatchlistStock> filterByStatus(
      List<WatchlistStock> stocks, String status) {
    return stocks.where((stock) => stock.status == status).toList();
  }

  List<WatchlistStock> filterByDateRange(
    List<WatchlistStock> stocks,
    DateTime startDate,
    DateTime endDate,
  ) {
    return stocks
        .where((stock) =>
            stock.entryDate.isAfter(startDate) &&
            stock.entryDate.isBefore(endDate))
        .toList();
  }

  List<WatchlistStock> filterByPerformance(
      List<WatchlistStock> stocks, double minReturn) {
    return stocks.where((stock) => stock.priceChangePct >= minReturn).toList();
  }

  // Analytics methods
  Map<String, dynamic> getStatistics(List<WatchlistStock> stocks) {
    if (stocks.isEmpty) {
      return {
        'totalStocks': 0,
        'activeSignals': 0,
        'averageReturn': 0.0,
        'profitableCount': 0,
        'totalValue': 0.0,
        'bestReturn': 0.0,
        'bestSymbol': '',
      };
    }

    final activeStocks = stocks.where((s) => s.status == 'ACTIVE').toList();
    final profitable = activeStocks.where((s) => s.priceChangePct > 0).length;

    final bestStock = activeStocks.isEmpty
        ? null
        : activeStocks
            .reduce((a, b) => a.priceChangePct > b.priceChangePct ? a : b);

    return {
      'totalStocks': stocks.length,
      'activeSignals': activeStocks.length,
      'averageReturn': activeStocks.isEmpty
          ? 0.0
          : activeStocks.map((s) => s.priceChangePct).reduce((a, b) => a + b) /
              activeStocks.length,
      'profitableCount': profitable,
      'totalValue': activeStocks.fold(0.0, (sum, s) => sum + s.currentPrice),
      'bestReturn': bestStock?.priceChangePct ?? 0.0,
      'bestSymbol': bestStock?.symbol ?? '',
    };
  }
}

@Riverpod(keepAlive: true)
class RecentTransactionsNotifier extends _$RecentTransactionsNotifier {
  @override
  Future<List<InsiderTransaction>> build() async {
    return _fetchTransactions();
  }

  Future<List<InsiderTransaction>> _fetchTransactions() async {
    final repository = ref.read(insiderTradeRepositoryProvider);
    return repository.getRecentTransactions();
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchTransactions());
  }

  // Filter methods
  List<InsiderTransaction> filterByTransactionType(
      List<InsiderTransaction> transactions, String type) {
    return transactions.where((tx) => tx.transactionType == type).toList();
  }

  List<InsiderTransaction> filterByDateRange(
      List<InsiderTransaction> transactions,
      DateTime startDate,
      DateTime endDate) {
    return transactions
        .where((tx) =>
            tx.transactionDate.isAfter(startDate) &&
            tx.transactionDate.isBefore(endDate))
        .toList();
  }

  List<InsiderTransaction> filterByValue(
      List<InsiderTransaction> transactions, double minValue) {
    return transactions
        .where((tx) => (tx.totalValue ?? 0) >= minValue)
        .toList();
  }

  // Analysis methods
  Map<String, dynamic> getTransactionStatistics(
      List<InsiderTransaction> transactions) {
    if (transactions.isEmpty) {
      return {
        'totalTransactions': 0,
        'totalValue': 0.0,
        'averageValue': 0.0,
        'purchaseCount': 0,
        'saleCount': 0,
        'largestTransaction': 0.0,
      };
    }

    final purchases = transactions
        .where((t) => t.transactionType.toLowerCase().contains('purchase'))
        .toList();

    return {
      'totalTransactions': transactions.length,
      'totalValue':
          transactions.fold(0.0, (sum, t) => sum + (t.totalValue ?? 0.0)),
      'averageValue':
          transactions.fold(0.0, (sum, t) => sum + (t.totalValue ?? 0.0)) /
              transactions.length,
      'purchaseCount': purchases.length,
      'saleCount': transactions.length - purchases.length,
      'largestTransaction': transactions
          .map((t) => t.totalValue ?? 0.0)
          .reduce((curr, next) => max(curr, next)),
    };
  }
}

// Helper providers for common use cases
@riverpod
Future<List<InsiderTransaction>> purchaseTransactions(
    PurchaseTransactionsRef ref) async {
  final transactions =
      await ref.watch(recentTransactionsNotifierProvider.future);
  return transactions
      .where((t) => t.transactionType.toLowerCase().contains('purchase'))
      .toList();
}

@riverpod
Future<List<InsiderTransaction>> saleTransactions(
    SaleTransactionsRef ref) async {
  final transactions =
      await ref.watch(recentTransactionsNotifierProvider.future);
  return transactions
      .where((t) => t.transactionType.toLowerCase().contains('sale'))
      .toList();
}

@riverpod
Future<Map<String, dynamic>> transactionStatistics(
    TransactionStatisticsRef ref) async {
  final transactions =
      await ref.watch(recentTransactionsNotifierProvider.future);
  return ref
      .read(recentTransactionsNotifierProvider.notifier)
      .getTransactionStatistics(transactions);
}

@riverpod
Future<Map<String, List<InsiderTransaction>>> transactionsBySymbol(
    TransactionsBySymbolRef ref) async {
  final transactions =
      await ref.watch(recentTransactionsNotifierProvider.future);
  return groupBy(transactions, (tx) => tx.symbol);
}

@riverpod
Future<TradeStats?> periodTradeStats(PeriodTradeStatsRef ref) async {
  final repository = ref.read(insiderTradeRepositoryProvider);
  final period = ref.watch(selectedPeriodProvider);
  final today = DateTime.now().toIso8601String().split('T')[0];

  return repository.getTradeStats(date: today, period: period);
}
