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
  const WatchlistStock._(); // Add a private constructor
  const factory WatchlistStock({
    required String id, // uuid
    required String symbol, // varchar
    String? clusterAnalysisId, // uuid
    required DateTime entryDate, // timestamptz
    required double insiderAvgPrice, // numeric
    required double currentPrice, // numeric
    required double priceChangePct, // numeric
    required int daysWatched, // int4
    String? analysisReasoning, // text
    List<String>? keyFactors, // _text
    List<String>? secFilingUrls, // _text
    List<String>? newsUrls, // _text
    required String status, // varchar
    required DateTime lastUpdated, // timestamptz
    required int avgDaysSinceLastBuy, // int4
    List<String>? tradeDates, // _text
    @Default([]) List<PricePoint> priceHistory,
    DateTime? createdAt,
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
    required String id, // uuid
    required String symbol, // varcgar
    required DateTime filingDate, // timestamptz
    required DateTime transactionDate, // date
    required String reportingName, // varchar
    required String reportingCik, // varchar
    String? companyCik, // varchar
    required String transactionType, // varchar
    double? securitiesTransacted, // numeric
    double? price, // numeric
    double? totalValue, // numeric
    String? typeOfOwner, // numeric
    String? link, // text
    String? securityName, // varchar
    String? formType, // varchar
    double? securitiesOwned, // numeric
    String? acquisitionDisposition, // varchar
    required DateTime createdAt, // timestamptz
  }) = _InsiderTransaction;

  factory InsiderTransaction.fromJson(Map<String, dynamic> json) =>
      _$InsiderTransactionFromJson(json);
}
