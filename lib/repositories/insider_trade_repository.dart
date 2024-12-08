// lib/repositories/insider_trade_repository.dart
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/insider_trade_models.dart';
import '../main.dart';

part 'insider_trade_repository.g.dart';

@riverpod
InsiderTradeRepository insiderTradeRepository(InsiderTradeRepositoryRef ref) {
  return InsiderTradeRepository();
}

class InsiderTradeRepository {
  // Get watchlist stocks with insider trading activity
  Future<List<WatchlistStock>> getWatchlist() async {
    try {
      final response = await supabase
          .from('watch_list')
          .select()
          .order('entry_date', ascending: false);

      return response.map<WatchlistStock>((data) {
        return WatchlistStock(
          id: data['id'],
          symbol: data['symbol'],
          clusterAnalysisId: data['cluster_analysis_id'],
          entryDate: DateTime.parse(data['entry_date']),
          insiderAvgPrice: (data['insider_avg_price'] ?? 0).toDouble(),
          currentPrice: (data['current_price'] ?? 0).toDouble(),
          priceChangePct: (data['price_change_pct'] ?? 0).toDouble(),
          daysWatched: data['days_watched'] ?? 0,
          analysisReasoning: data['analysis_reasoning'],
          keyFactors: List<String>.from(data['key_factors'] ?? []),
          secFilingUrls: List<String>.from(data['sec_filing_urls'] ?? []),
          newsUrls: List<String>.from(data['news_urls'] ?? []),
          status: data['status'] ?? 'ACTIVE',
          lastUpdated: data['last_updated'] != null
              ? DateTime.parse(data['last_updated'])
              : DateTime(1970, 1, 1),
          priceHistory: List<PricePoint>.from([
            for (var point in data['price_history'] ?? [])
              PricePoint.fromJson(point)
          ]),
        );
      }).toList();
    } catch (e) {
      debugPrint('Error fetching watchlist stocks: $e');
      return [];
    }
  }

  // Get recent insider transactions
  Future<List<InsiderTransaction>> getRecentTransactions(
      {int limit = 20}) async {
    try {
      final response = await supabase
          .from('insider_trades')
          .select()
          .order('filing_date', ascending: false)
          .limit(limit);

      return response
          .map((data) => InsiderTransaction(
                id: data['id'],
                symbol: data['symbol'],
                filingDate: DateTime.parse(data['filing_date']),
                transactionDate: DateTime.parse(data['transaction_date']),
                reportingName: data['reporting_name'],
                reportingCik: data['reporting_cik'],
                companyCik: data['company_cik'],
                transactionType: data['transaction_type'],
                securitiesTransacted:
                    (data['securities_transacted'] ?? 0).toDouble(),
                price: (data['price'] ?? 0).toDouble(),
                totalValue: (data['total_value'] ?? 0).toDouble(),
                typeOfOwner: data['type_of_owner'],
                link: data['link'],
                securityName: data['security_name'],
                formType: data['form_type'],
                securitiesOwned: (data['securities_owned'] ?? 0).toDouble(),
                acquisitionDisposition: data['acquisition_disposition'],
                createdAt: data['created_at'] != null
                    ? DateTime.parse(data['created_at'])
                    : null,
              ))
          .toList();
    } catch (e) {
      debugPrint('Error fetching recent insider transactions: $e');
      rethrow;
    }
  }

  // Get trade statistics
  Future<TradeStats?> getTradeStats(
      {String? date, String period = 'daily'}) async {
    try {
      final today = date ?? DateTime.now().toIso8601String().split('T')[0];

      final response = await supabase
          .from('trade_stats')
          .select()
          .eq('date', today)
          .eq('period', period)
          .single();

      return TradeStats(
        id: response['id'],
        date: DateTime.parse(response['date']),
        totalTrades: response['total_trades'],
        buyCount: response['buy_count'],
        sellCount: response['sell_count'],
        totalBuyValue: (response['total_buy_value'] ?? 0).toDouble(),
        totalSellValue: (response['total_sell_value'] ?? 0).toDouble(),
        uniqueSymbols: response['unique_symbols'],
        period: response['period'],
        createdAt: response['created_at'] != null
            ? DateTime.parse(response['created_at'])
            : null,
      );
    } catch (e) {
      debugPrint('Error fetching trade stats: $e');
      return null;
    }
  }

  // Get all trade statistics for different periods
  Future<Map<String, TradeStats>> getAllTradeStats({String? date}) async {
    try {
      final today = date ?? DateTime.now().toIso8601String().split('T')[0];
      final periods = ['daily', 'weekly', 'monthly'];

      final futures = periods.map((period) =>
          getTradeStats(date: today, period: period)
              .then((stats) => MapEntry(period, stats)));

      final entries = await Future.wait(futures);
      final allStats = <String, TradeStats>{};

      for (var entry in entries) {
        if (entry.value != null) {
          allStats[entry.key] = entry.value!;
        }
      }

      return allStats;
    } catch (e) {
      debugPrint('Error fetching all trade stats: $e');
      return {};
    }
  }

  // Get cluster detections
  Future<List<ClusterDetection>> getClusterDetections() async {
    try {
      final response = await supabase
          .from('cluster_detection')
          .select()
          .order('detected_at', ascending: false);

      return response
          .map((data) => ClusterDetection(
                id: data['id'],
                symbol: data['symbol'],
                clusterStartDate: DateTime.parse(data['cluster_start_date']),
                clusterEndDate: DateTime.parse(data['cluster_end_date']),
                totalValue: (data['total_value'] ?? 0).toDouble(),
                buyerCount: data['buyer_count'] ?? 0,
                transactionCount: data['transaction_count'] ?? 0,
                insiderAvgPrice: (data['insider_avg_price'] ?? 0).toDouble(),
                detectedAt: DateTime.parse(data['detected_at']),
                scannedByAi: data['scanned_by_ai'] ?? false,
                createdAt: data['created_at'] != null
                    ? DateTime.parse(data['created_at'])
                    : null,
              ))
          .toList();
    } catch (e) {
      debugPrint('Error fetching cluster detections: $e');
      rethrow;
    }
  }

  // Get cluster analysis
  Future<List<ClusterAnalysis>> getClusterAnalysis() async {
    try {
      final response = await supabase
          .from('cluster_analysis')
          .select()
          .order('analysis_date', ascending: false);

      return response
          .map((data) => ClusterAnalysis(
                id: data['id'],
                clusterDetectionId: data['cluster_detection_id'],
                symbol: data['symbol'],
                analysisDate: DateTime.parse(data['analysis_date']),
                analysisType: data['analysis_type'],
                analysisReasoning: data['analysis_reasoning'],
                confidenceScore: data['confidence_score'],
                keyFactors: List<String>.from(data['key_factors'] ?? []),
                secFilingUrls: List<String>.from(data['sec_filing_urls'] ?? []),
                newsUrls: List<String>.from(data['news_urls'] ?? []),
                priceAtAnalysis: (data['price_at_analysis'] ?? 0).toDouble(),
                insiderAvgPrice: (data['insider_avg_price'] ?? 0).toDouble(),
                addedToWatchlist: data['added_to_watchlist'] ?? false,
                createdAt: data['created_at'] != null
                    ? DateTime.parse(data['created_at'])
                    : null,
              ))
          .toList();
    } catch (e) {
      debugPrint('Error fetching cluster analysis: $e');
      rethrow;
    }
  }

  // Get watchlist history
  Future<List<WatchlistHistory>> getWatchlistHistory() async {
    try {
      final response = await supabase
          .from('watch_list_history')
          .select()
          .order('exit_date', ascending: false);

      return response
          .map((data) => WatchlistHistory(
                id: data['id'],
                watchListId: data['watch_list_id'],
                symbol: data['symbol'],
                entryDate: DateTime.parse(data['entry_date']),
                exitDate: DateTime.parse(data['exit_date']),
                insiderAvgPrice: (data['insider_avg_price'] ?? 0).toDouble(),
                exitPrice: (data['exit_price'] ?? 0).toDouble(),
                totalReturnPct: (data['total_return_pct'] ?? 0).toDouble(),
                daysWatched: data['days_watched'] ?? 0,
                originalAnalysis: data['original_analysis'],
                exitReason: data['exit_reason'],
                secFilingUrls: List<String>.from(data['sec_filing_urls'] ?? []),
                newsUrls: List<String>.from(data['news_urls'] ?? []),
                createdAt: data['created_at'] != null
                    ? DateTime.parse(data['created_at'])
                    : null,
              ))
          .toList();
    } catch (e) {
      debugPrint('Error fetching watchlist history: $e');
      rethrow;
    }
  }
}
