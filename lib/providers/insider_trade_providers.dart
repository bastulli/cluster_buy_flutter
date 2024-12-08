// lib/providers/insider_trade_providers.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';
import '../repositories/insider_trade_repository.dart';
import 'dart:math';
import '../models/insider_trade_models.dart';

part 'insider_trade_providers.g.dart';

@Riverpod(keepAlive: true)
class SelectedPeriod extends _$SelectedPeriod {
  @override
  String build() => 'daily'; // Default to daily view

  void setPeriod(String period) {
    if (period == 'daily' || period == 'weekly' || period == 'monthly') {
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
    return _sortByInsiderAvgPriceGain(watchlist);
  }

  List<WatchlistStock> _sortByInsiderAvgPriceGain(List<WatchlistStock> stocks) {
    return List<WatchlistStock>.from(stocks)
      ..sort((a, b) {
        // Calculate gain percentages relative to insider average price
        final aGainPct =
            ((a.currentPrice - a.insiderAvgPrice) / a.insiderAvgPrice) * 100;
        final bGainPct =
            ((b.currentPrice - b.insiderAvgPrice) / b.insiderAvgPrice) * 100;
        // Sort in descending order (highest gain first)
        return bGainPct.compareTo(aGainPct);
      });
  }

  Future<void> refresh() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _fetchWatchlist());
  }

  Future<void> addToWatchlist(WatchlistStock stock) async {
    state.whenData((currentStocks) {
      final sortedStocks =
          _sortByInsiderAvgPriceGain([stock, ...currentStocks]);
      state = AsyncData(sortedStocks);
    });
    await refresh();
  }

  Future<void> removeFromWatchlist(String id) async {
    state.whenData((currentStocks) {
      final updatedStocks = currentStocks.where((s) => s.id != id).toList();
      final sortedStocks = _sortByInsiderAvgPriceGain(updatedStocks);
      state = AsyncData(sortedStocks);
    });
    await refresh();
  }

  Future<void> updateStock(WatchlistStock updatedStock) async {
    state.whenData((currentStocks) {
      final index = currentStocks.indexWhere((s) => s.id == updatedStock.id);
      if (index != -1) {
        final newList = List<WatchlistStock>.from(currentStocks);
        newList[index] = updatedStock;
        final sortedStocks = _sortByInsiderAvgPriceGain(newList);
        state = AsyncData(sortedStocks);
      }
    });
    await refresh();
  }

  // Add the missing getStatistics method
  Future<Map<String, dynamic>> getStatistics() async {
    final stocks = await future;
    final activeStocks = stocks.where((s) => s.status == 'ACTIVE').toList();
    final profitable = activeStocks.where((s) => s.priceChangePct > 0).length;

    // Calculate total value and average return
    final totalValue =
        activeStocks.fold(0.0, (sum, stock) => sum + stock.currentPrice);
    final averageReturn = activeStocks.isEmpty
        ? 0.0
        : activeStocks.map((s) => s.priceChangePct).reduce((a, b) => a + b) /
            activeStocks.length;

    // Calculate insider price gains
    final insiderGains = activeStocks.map((s) {
      return ((s.currentPrice - s.insiderAvgPrice) / s.insiderAvgPrice) * 100;
    }).toList();

    final averageInsiderGain = insiderGains.isEmpty
        ? 0.0
        : insiderGains.reduce((a, b) => a + b) / insiderGains.length;

    return {
      'totalStocks': stocks.length,
      'activeSignals': activeStocks.length,
      'profitableCount': profitable,
      'averageReturn': averageReturn,
      'totalValue': totalValue,
      'winRate': activeStocks.isEmpty ? 0.0 : profitable / activeStocks.length,
      'averageInsiderGain': averageInsiderGain,
      'bestInsiderGain': insiderGains.isEmpty ? 0.0 : insiderGains.reduce(max),
    };
  }

  // Filtering methods
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
    List<WatchlistStock> stocks,
    double minReturn,
  ) {
    return stocks.where((stock) => stock.priceChangePct >= minReturn).toList();
  }

  // Sort methods
  List<WatchlistStock> sortByPerformance(
    List<WatchlistStock> stocks, {
    bool ascending = false,
  }) {
    final sortedStocks = List<WatchlistStock>.from(stocks);
    sortedStocks.sort((a, b) => ascending
        ? a.priceChangePct.compareTo(b.priceChangePct)
        : b.priceChangePct.compareTo(a.priceChangePct));
    return sortedStocks;
  }

  List<WatchlistStock> sortByDate(
    List<WatchlistStock> stocks, {
    bool ascending = false,
  }) {
    final sortedStocks = List<WatchlistStock>.from(stocks);
    sortedStocks.sort((a, b) => ascending
        ? a.entryDate.compareTo(b.entryDate)
        : b.entryDate.compareTo(a.entryDate));
    return sortedStocks;
  }
}

@riverpod
Future<List<WatchlistStock>> activeWatchlist(ActiveWatchlistRef ref) async {
  final watchlist = await ref.watch(watchlistNotifierProvider.future);
  return watchlist.where((stock) => stock.status == 'ACTIVE').toList();
}

@riverpod
Future<List<WatchlistStock>> profitableWatchlist(
    ProfitableWatchlistRef ref) async {
  final watchlist = await ref.watch(watchlistNotifierProvider.future);
  return watchlist
      .where((stock) => stock.priceChangePct > 0 && stock.status == 'ACTIVE')
      .toList();
}

@riverpod
Future<Map<String, dynamic>> watchlistStatistics(
    WatchlistStatisticsRef ref) async {
  return ref.watch(watchlistNotifierProvider.notifier).getStatistics();
}

// Period-specific trade stats providers
@riverpod
Future<TradeStats?> periodTradeStats(PeriodTradeStatsRef ref) async {
  final repository = ref.read(insiderTradeRepositoryProvider);
  final period = ref.watch(selectedPeriodProvider);
  final today = DateTime.now().toIso8601String().split('T')[0];

  return repository.getTradeStats(date: today, period: period);
}

@riverpod
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
    List<InsiderTransaction> transactions,
    String type,
  ) {
    return transactions
        .where((transaction) => transaction.transactionType == type)
        .toList();
  }

  List<InsiderTransaction> filterByDateRange(
    List<InsiderTransaction> transactions,
    DateTime startDate,
    DateTime endDate,
  ) {
    return transactions
        .where((transaction) =>
            transaction.transactionDate.isAfter(startDate) &&
            transaction.transactionDate.isBefore(endDate))
        .toList();
  }

  List<InsiderTransaction> filterByValue(
    List<InsiderTransaction> transactions,
    double minValue,
  ) {
    return transactions
        .where((transaction) => transaction.totalValue >= minValue)
        .toList();
  }

  // Sort methods
  List<InsiderTransaction> sortByValue(
    List<InsiderTransaction> transactions, {
    bool ascending = false,
  }) {
    final sortedTransactions = List<InsiderTransaction>.from(transactions);
    sortedTransactions.sort((a, b) => ascending
        ? a.totalValue.compareTo(b.totalValue)
        : b.totalValue.compareTo(a.totalValue));
    return sortedTransactions;
  }

  List<InsiderTransaction> sortByDate(
    List<InsiderTransaction> transactions, {
    bool ascending = false,
  }) {
    final sortedTransactions = List<InsiderTransaction>.from(transactions);
    sortedTransactions.sort((a, b) => ascending
        ? a.transactionDate.compareTo(b.transactionDate)
        : b.transactionDate.compareTo(a.transactionDate));
    return sortedTransactions;
  }

  // Helper methods to get transaction statistics
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
      'totalValue': transactions.fold(0.0, (sum, t) => sum + t.totalValue),
      'averageValue': transactions.fold(0.0, (sum, t) => sum + t.totalValue) /
          transactions.length,
      'purchaseCount': purchases.length,
      'saleCount': transactions.length - purchases.length,
      'largestTransaction': transactions
          .map((t) => t.totalValue)
          .reduce((curr, next) => curr > next ? curr : next),
    };
  }

  // Group transactions by symbol
  Map<String, List<InsiderTransaction>> groupBySymbol(
      List<InsiderTransaction> transactions) {
    return groupBy(transactions, (transaction) => transaction.symbol);
  }

  // Get transactions for a specific symbol
  List<InsiderTransaction> getTransactionsForSymbol(
      List<InsiderTransaction> transactions, String symbol) {
    return transactions
        .where((transaction) => transaction.symbol == symbol)
        .toList();
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
  return ref
      .read(recentTransactionsNotifierProvider.notifier)
      .groupBySymbol(transactions);
}
