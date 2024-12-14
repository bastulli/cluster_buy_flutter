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
class TradeStats with _$TradeStats {
  const factory TradeStats({
    required String id,
    required DateTime date,
    required String period,
    required int totalTrades,
    required int buyCount,
    required int sellCount,
    required double totalBuyValue,
    required double totalSellValue,
    required double buySecurities,
    required double sellSecurities,
    required int uniqueBuyers,
    required int uniqueSellers,
    required int uniqueSymbols,
    required int buySymbols,
    required int sellSymbols,
    required double buyRatio,
    required double sellRatio,
    required double avgBuyValue,
    required double avgSellValue,
    required List<Map<String, dynamic>> topBuySymbols,
    required List<Map<String, dynamic>> topSellSymbols,
    required DateTime createdAt,
  }) = _TradeStats;

  factory TradeStats.fromJson(Map<String, dynamic> json) =>
      _$TradeStatsFromJson(json);
}

@freezed
class WatchlistStock with _$WatchlistStock {
  const factory WatchlistStock({
    required String id,
    required String symbol,
    String? clusterAnalysisId,
    required DateTime entryDate,
    required double insiderAvgPrice,
    required double currentPrice,
    required double priceChangePct,
    required int daysWatched,
    String? analysisReasoning,
    List<String>? keyFactors,
    List<String>? secFilingUrls,
    List<String>? newsUrls,
    required String status,
    required DateTime lastUpdated,
    @Default([]) List<PricePoint> priceHistory,
  }) = _WatchlistStock;

  factory WatchlistStock.fromJson(Map<String, dynamic> json) =>
      _$WatchlistStockFromJson(json);
}

@freezed
class PricePoint with _$PricePoint {
  const factory PricePoint({
    required DateTime date,
    required double price,
    int? volume,
  }) = _PricePoint;

  factory PricePoint.fromJson(Map<String, dynamic> json) =>
      _$PricePointFromJson(json);
}

@freezed
class WatchlistHistory with _$WatchlistHistory {
  const factory WatchlistHistory({
    required String id,
    String? watchListId,
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
class InsiderTransaction with _$InsiderTransaction {
  const factory InsiderTransaction({
    required String id,
    required String symbol,
    required DateTime filingDate,
    required DateTime transactionDate,
    required String reportingName,
    required String reportingCik,
    String? companyCik,
    required String transactionType,
    double? securitiesTransacted,
    double? price,
    double? totalValue,
    String? typeOfOwner,
    String? link,
    String? securityName,
    String? formType,
    double? securitiesOwned,
    String? acquisitionDisposition,
    required DateTime createdAt,
  }) = _InsiderTransaction;

  factory InsiderTransaction.fromJson(Map<String, dynamic> json) =>
      _$InsiderTransactionFromJson(json);
}
