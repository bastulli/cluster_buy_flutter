// lib/models/insider_trade_models.dart
import 'package:freezed_annotation/freezed_annotation.dart';

part 'insider_trade_models.freezed.dart';
part 'insider_trade_models.g.dart';

@freezed
class ClusterDetection with _$ClusterDetection {
  const factory ClusterDetection({
    required String id,
    required String symbol,
    required DateTime clusterStartDate,
    required DateTime clusterEndDate,
    required double totalValue,
    required int buyerCount,
    required int transactionCount,
    required double insiderAvgPrice,
    required DateTime detectedAt,
    @Default(false) bool scannedByAi,
    DateTime? createdAt,
  }) = _ClusterDetection;

  factory ClusterDetection.fromJson(Map<String, dynamic> json) =>
      _$ClusterDetectionFromJson(json);
}

@freezed
class ClusterAnalysis with _$ClusterAnalysis {
  const factory ClusterAnalysis({
    required String id,
    required String clusterDetectionId,
    required String symbol,
    required DateTime analysisDate,
    required String analysisType,
    required String analysisReasoning,
    required int confidenceScore,
    required List<String> keyFactors,
    required List<String> secFilingUrls,
    required List<String> newsUrls,
    required double priceAtAnalysis,
    required double insiderAvgPrice,
    @Default(false) bool addedToWatchlist,
    DateTime? createdAt,
  }) = _ClusterAnalysis;

  factory ClusterAnalysis.fromJson(Map<String, dynamic> json) =>
      _$ClusterAnalysisFromJson(json);
}

@freezed
class InsiderTransaction with _$InsiderTransaction {
  const factory InsiderTransaction({
    required int id, // Changed from String to int
    required String symbol,
    required DateTime filingDate,
    required DateTime transactionDate,
    required String reportingName,
    required String reportingCik,
    required String companyCik,
    required String transactionType,
    required double securitiesTransacted,
    required double price,
    required double totalValue,
    required String typeOfOwner,
    String? link,
    String? securityName,
    String? formType,
    double? securitiesOwned,
    String? acquisitionDisposition,
    DateTime? createdAt,
  }) = _InsiderTransaction;

  factory InsiderTransaction.fromJson(Map<String, dynamic> json) =>
      _$InsiderTransactionFromJson(json);
}

@freezed
class TradeStats with _$TradeStats {
  const factory TradeStats({
    required String id,
    required DateTime date,
    required int totalTrades,
    required int buyCount,
    required int sellCount,
    required double totalBuyValue,
    required double totalSellValue,
    required int uniqueSymbols,
    required String period,
    DateTime? createdAt,
  }) = _TradeStats;

  factory TradeStats.fromJson(Map<String, dynamic> json) =>
      _$TradeStatsFromJson(json);
}

@freezed
class WatchlistStock with _$WatchlistStock {
  const factory WatchlistStock({
    required String id,
    required String symbol,
    required String clusterAnalysisId,
    required DateTime entryDate,
    required double insiderAvgPrice,
    required double currentPrice,
    required double priceChangePct,
    required int daysWatched,
    required String analysisReasoning,
    required List<String> keyFactors,
    required List<String> secFilingUrls,
    required List<String> newsUrls,
    required String status,
    required DateTime lastUpdated,
    required List<PricePoint> priceHistory,
  }) = _WatchlistStock;

  factory WatchlistStock.fromJson(Map<String, dynamic> json) =>
      _$WatchlistStockFromJson(json);
}

@freezed
class PricePoint with _$PricePoint {
  const factory PricePoint({
    required String date,
    required double price,
  }) = _PricePoint;

  factory PricePoint.fromJson(Map<String, dynamic> json) =>
      _$PricePointFromJson(json);
}

@freezed
class WatchlistHistory with _$WatchlistHistory {
  const factory WatchlistHistory({
    required String id,
    required String watchListId,
    required String symbol,
    required DateTime entryDate,
    required DateTime exitDate,
    required double insiderAvgPrice,
    required double exitPrice,
    required double totalReturnPct,
    required int daysWatched,
    String? originalAnalysis,
    String? exitReason,
    List<String>? secFilingUrls,
    List<String>? newsUrls,
    DateTime? createdAt,
  }) = _WatchlistHistory;

  factory WatchlistHistory.fromJson(Map<String, dynamic> json) =>
      _$WatchlistHistoryFromJson(json);
}

@freezed
class WatchlistSummary with _$WatchlistSummary {
  const factory WatchlistSummary({
    required int totalStocks,
    required int activeSignals,
    required double averageReturn,
    required int profitablePositions,
    required double bestPerformer,
    required String bestSymbol,
    required double totalValue,
    @Default(0.0) double realizedGain,
    @Default(0.0) double unrealizedGain,
    @Default({}) Map<String, double> sectorAllocation,
    @Default(0) int totalTransactions,
    @Default(0.0) double averageTransactionSize,
    DateTime? lastUpdated,
    @Default([]) List<String> topPerformers,
    @Default([]) List<String> recentlyAdded,
  }) = _WatchlistSummary;

  factory WatchlistSummary.fromJson(Map<String, dynamic> json) =>
      _$WatchlistSummaryFromJson(json);
}

// Extension methods for additional functionality
extension WatchlistSummaryExtension on WatchlistSummary {
  // Calculate win rate
  double get winRate =>
      totalStocks > 0 ? profitablePositions / totalStocks : 0.0;

  // Calculate total gain/loss
  double get totalGain => realizedGain + unrealizedGain;

  // Calculate active rate
  double get activeRate => totalStocks > 0 ? activeSignals / totalStocks : 0.0;

  // Get top sector allocations (top 5)
  Map<String, double> get topSectors {
    final sortedSectors = sectorAllocation.entries.toList()
      ..sort((a, b) => b.value.compareTo(a.value));
    return Map.fromEntries(sortedSectors.take(5));
  }

  // Check if summary is stale (older than 1 hour)
  bool get isStale =>
      lastUpdated != null &&
      DateTime.now().difference(lastUpdated!) > const Duration(hours: 1);

  // Create empty summary
  static WatchlistSummary empty() => const WatchlistSummary(
        totalStocks: 0,
        activeSignals: 0,
        averageReturn: 0,
        profitablePositions: 0,
        bestPerformer: 0,
        bestSymbol: '',
        totalValue: 0,
        lastUpdated: null,
      );
}
