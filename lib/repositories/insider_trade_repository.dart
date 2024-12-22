// lib/repositories/insider_trade_repository.dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/insider_trade_models.dart';
import '../main.dart';
part 'insider_trade_repository.g.dart';

@riverpod
InsiderTradeRepository insiderTradeRepository(InsiderTradeRepositoryRef ref) {
  return InsiderTradeRepository();
}

class InsiderTradeRepository {
  Future<List<WatchlistStock>> getWatchlist() async {
    try {
      final response = await supabase
          .from('watch_list')
          .select()
          .order('entry_date', ascending: false);

      final List<WatchlistStock> stocks = [];
      for (final data in response) {
        final priceHistoryResponse = await supabase
            .from('price_history')
            .select()
            .eq('symbol', data['symbol'])
            .order('date', ascending: true);

        final priceHistory = (priceHistoryResponse as List)
            .map((item) => PricePoint(
                  date: DateTime.parse(item['date']),
                  price: (item['price'] as num).toDouble(),
                  volume: item['volume'] != null
                      ? (item['volume'] as num).toInt()
                      : null,
                ))
            .toList();

        // Handle null createdAt
        DateTime createdAt = data['created_at'] != null
            ? DateTime.parse(data['created_at'])
            : DateTime.now(); // Provide a default value (e.g., current time)

        // Parse trade dates if available
        List<String>? tradeDates;
        if (data['trade_dates'] != null) {
          tradeDates = List<String>.from(jsonDecode(data['trade_dates']));
        }

        // Create WatchlistStock instance
        var stock = WatchlistStock(
          createdAt: createdAt,
          id: data['id'],
          symbol: data['symbol'],
          clusterAnalysisId: data['cluster_analysis_id'],
          entryDate: DateTime.parse(data['entry_date']),
          insiderAvgPrice: (data['insider_avg_price'] as num).toDouble(),
          currentPrice: (data['current_price'] as num).toDouble(),
          priceChangePct: (data['price_change_pct'] as num).toDouble(),
          daysWatched: data['days_watched'],
          analysisReasoning: data['analysis_reasoning']?.toString(),
          keyFactors: (data['key_factors'] as List?)?.cast<String>() ?? [],
          secFilingUrls:
              (data['sec_filing_urls'] as List?)?.cast<String>() ?? [],
          newsUrls: (data['news_urls'] as List?)?.cast<String>() ?? [],
          status: data['status'] ?? 'ACTIVE',
          lastUpdated: DateTime.parse(data['last_updated']),
          priceHistory: priceHistory,
          tradeDates: tradeDates,
          avgDaysSinceLastBuy: data['avg_days_since_last_buy'],
        );

        stocks.add(stock);
      }

      return stocks;
    } catch (e) {
      debugPrint('Error fetching watchlist stocks: $e');
      rethrow;
    }
  }

  Future<List<InsiderTransaction>> getRecentTransactions(
      {int limit = 100}) async {
    try {
      final response = await supabase
          .from('insider_trades')
          .select()
          .order('filing_date', ascending: false)
          .limit(limit);

      return response
          .map<InsiderTransaction>((data) => InsiderTransaction(
                id: data['id'],
                symbol: data['symbol'],
                filingDate: DateTime.parse(data['filing_date']),
                transactionDate: DateTime.parse(data['transaction_date']),
                reportingName: data['reporting_name'],
                reportingCik: data['reporting_cik'],
                companyCik: data['company_cik'], // Nullable
                transactionType: data['transaction_type'],
                securitiesTransacted: data['securities_transacted'] != null
                    ? (data['securities_transacted'] as num).toDouble()
                    : null,
                price: data['price'] != null
                    ? (data['price'] as num).toDouble()
                    : null,
                totalValue: data['total_value'] != null
                    ? (data['total_value'] as num).toDouble()
                    : null,
                typeOfOwner: data['type_of_owner'] ?? '',
                link: data['link'],
                securityName: data['security_name'],
                formType: data['form_type'],
                securitiesOwned: data['securities_owned'] != null
                    ? (data['securities_owned'] as num).toDouble()
                    : null,
                acquisitionDisposition: data['acquisition_disposition'],
                createdAt: DateTime.parse(data['created_at']),
              ))
          .toList();
    } catch (e) {
      debugPrint('Error fetching recent insider transactions: $e');
      rethrow;
    }
  }

  Future<TradeStats?> getTradeStats(
      {String? date, String period = 'daily'}) async {
    try {
      final today = date ?? DateTime.now().toIso8601String().split('T')[0];

      final response = await supabase
          .from('trade_stats')
          .select()
          .eq('date', today)
          .eq('period', period)
          .maybeSingle();

      if (response == null) {
        debugPrint('No trade stats found for $period on $today');
        return null;
      }

      // All fields are non-nullable according to schema
      return TradeStats(
        id: response['id'],
        date: DateTime.parse(response['date']),
        period: response['period'],
        totalTrades: response['total_trades'],
        buyCount: response['buy_count'],
        sellCount: response['sell_count'],
        totalBuyValue: (response['total_buy_value'] as num).toDouble(),
        totalSellValue: (response['total_sell_value'] as num).toDouble(),
        buySecurities: (response['buy_securities'] as num).toDouble(),
        sellSecurities: (response['sell_securities'] as num).toDouble(),
        uniqueBuyers: response['unique_buyers'],
        uniqueSellers: response['unique_sellers'],
        uniqueSymbols: response['unique_symbols'],
        buySymbols: response['buy_symbols'],
        sellSymbols: response['sell_symbols'],
        buyRatio: (response['buy_ratio'] as num).toDouble(),
        sellRatio: (response['sell_ratio'] as num).toDouble(),
        avgBuyValue: (response['avg_buy_value'] as num).toDouble(),
        avgSellValue: (response['avg_sell_value'] as num).toDouble(),
        // Handle JSONB arrays properly
        topBuySymbols: (response['top_buy_symbols'] as List<dynamic>)
            .map((item) => Map<String, dynamic>.from(item))
            .toList(),
        topSellSymbols: (response['top_sell_symbols'] as List<dynamic>)
            .map((item) => Map<String, dynamic>.from(item))
            .toList(),
        createdAt: DateTime.parse(response['created_at']),
      );
    } catch (e) {
      debugPrint('Error fetching trade stats for period $period: $e');
      rethrow;
    }
  }

  Future<Map<String, TradeStats>> getAllTradeStats({String? date}) async {
    try {
      final today = date ?? DateTime.now().toIso8601String().split('T')[0];

      final response =
          await supabase.from('trade_stats').select().eq('date', today);

      final Map<String, TradeStats> allStats = {};

      for (final statData in response) {
        try {
          // Safely parse JSONB arrays
          List<Map<String, dynamic>> parseJsonbArray(dynamic value) {
            if (value == null) return [];
            if (value is String) {
              // If it's a string, try to parse it as JSON
              try {
                final parsed = json.decode(value);
                if (parsed is List) {
                  return parsed
                      .map((item) => Map<String, dynamic>.from(item))
                      .toList();
                }
              } catch (_) {}
              return [];
            }
            if (value is List) {
              return value
                  .map((item) => Map<String, dynamic>.from(item))
                  .toList();
            }
            return [];
          }

          final stats = TradeStats(
            id: statData['id'],
            date: DateTime.parse(statData['date']),
            period: statData['period'],
            totalTrades: statData['total_trades'],
            buyCount: statData['buy_count'],
            sellCount: statData['sell_count'],
            totalBuyValue: (statData['total_buy_value'] as num).toDouble(),
            totalSellValue: (statData['total_sell_value'] as num).toDouble(),
            buySecurities: (statData['buy_securities'] as num).toDouble(),
            sellSecurities: (statData['sell_securities'] as num).toDouble(),
            uniqueBuyers: statData['unique_buyers'],
            uniqueSellers: statData['unique_sellers'],
            uniqueSymbols: statData['unique_symbols'],
            buySymbols: statData['buy_symbols'],
            sellSymbols: statData['sell_symbols'],
            buyRatio: (statData['buy_ratio'] as num).toDouble(),
            sellRatio: (statData['sell_ratio'] as num).toDouble(),
            avgBuyValue: (statData['avg_buy_value'] as num).toDouble(),
            avgSellValue: (statData['avg_sell_value'] as num).toDouble(),
            topBuySymbols: parseJsonbArray(statData['top_buy_symbols']),
            topSellSymbols: parseJsonbArray(statData['top_sell_symbols']),
            createdAt: DateTime.parse(statData['created_at']),
          );
          allStats[statData['period']] = stats;
        } catch (e, stackTrace) {
          debugPrint(
              'Error parsing stats for period ${statData['period']}: $e');
          debugPrint(stackTrace.toString());
          continue;
        }
      }

      return allStats;
    } catch (e) {
      debugPrint('Error fetching all trade stats: $e');
      return {};
    }
  }
}
