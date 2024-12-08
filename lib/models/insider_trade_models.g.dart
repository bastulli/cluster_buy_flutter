// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insider_trade_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ClusterDetectionImpl _$$ClusterDetectionImplFromJson(
        Map<String, dynamic> json) =>
    _$ClusterDetectionImpl(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      clusterStartDate: DateTime.parse(json['clusterStartDate'] as String),
      clusterEndDate: DateTime.parse(json['clusterEndDate'] as String),
      totalValue: (json['totalValue'] as num).toDouble(),
      buyerCount: (json['buyerCount'] as num).toInt(),
      transactionCount: (json['transactionCount'] as num).toInt(),
      insiderAvgPrice: (json['insiderAvgPrice'] as num).toDouble(),
      detectedAt: DateTime.parse(json['detectedAt'] as String),
      scannedByAi: json['scannedByAi'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ClusterDetectionImplToJson(
        _$ClusterDetectionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'clusterStartDate': instance.clusterStartDate.toIso8601String(),
      'clusterEndDate': instance.clusterEndDate.toIso8601String(),
      'totalValue': instance.totalValue,
      'buyerCount': instance.buyerCount,
      'transactionCount': instance.transactionCount,
      'insiderAvgPrice': instance.insiderAvgPrice,
      'detectedAt': instance.detectedAt.toIso8601String(),
      'scannedByAi': instance.scannedByAi,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$ClusterAnalysisImpl _$$ClusterAnalysisImplFromJson(
        Map<String, dynamic> json) =>
    _$ClusterAnalysisImpl(
      id: json['id'] as String,
      clusterDetectionId: json['clusterDetectionId'] as String,
      symbol: json['symbol'] as String,
      analysisDate: DateTime.parse(json['analysisDate'] as String),
      analysisType: json['analysisType'] as String,
      analysisReasoning: json['analysisReasoning'] as String,
      confidenceScore: (json['confidenceScore'] as num).toInt(),
      keyFactors: (json['keyFactors'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      secFilingUrls: (json['secFilingUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      newsUrls:
          (json['newsUrls'] as List<dynamic>).map((e) => e as String).toList(),
      priceAtAnalysis: (json['priceAtAnalysis'] as num).toDouble(),
      insiderAvgPrice: (json['insiderAvgPrice'] as num).toDouble(),
      addedToWatchlist: json['addedToWatchlist'] as bool? ?? false,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$ClusterAnalysisImplToJson(
        _$ClusterAnalysisImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'clusterDetectionId': instance.clusterDetectionId,
      'symbol': instance.symbol,
      'analysisDate': instance.analysisDate.toIso8601String(),
      'analysisType': instance.analysisType,
      'analysisReasoning': instance.analysisReasoning,
      'confidenceScore': instance.confidenceScore,
      'keyFactors': instance.keyFactors,
      'secFilingUrls': instance.secFilingUrls,
      'newsUrls': instance.newsUrls,
      'priceAtAnalysis': instance.priceAtAnalysis,
      'insiderAvgPrice': instance.insiderAvgPrice,
      'addedToWatchlist': instance.addedToWatchlist,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$InsiderTransactionImpl _$$InsiderTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$InsiderTransactionImpl(
      id: (json['id'] as num).toInt(),
      symbol: json['symbol'] as String,
      filingDate: DateTime.parse(json['filingDate'] as String),
      transactionDate: DateTime.parse(json['transactionDate'] as String),
      reportingName: json['reportingName'] as String,
      reportingCik: json['reportingCik'] as String,
      companyCik: json['companyCik'] as String,
      transactionType: json['transactionType'] as String,
      securitiesTransacted: (json['securitiesTransacted'] as num).toDouble(),
      price: (json['price'] as num).toDouble(),
      totalValue: (json['totalValue'] as num).toDouble(),
      typeOfOwner: json['typeOfOwner'] as String,
      link: json['link'] as String?,
      securityName: json['securityName'] as String?,
      formType: json['formType'] as String?,
      securitiesOwned: (json['securitiesOwned'] as num?)?.toDouble(),
      acquisitionDisposition: json['acquisitionDisposition'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$InsiderTransactionImplToJson(
        _$InsiderTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'filingDate': instance.filingDate.toIso8601String(),
      'transactionDate': instance.transactionDate.toIso8601String(),
      'reportingName': instance.reportingName,
      'reportingCik': instance.reportingCik,
      'companyCik': instance.companyCik,
      'transactionType': instance.transactionType,
      'securitiesTransacted': instance.securitiesTransacted,
      'price': instance.price,
      'totalValue': instance.totalValue,
      'typeOfOwner': instance.typeOfOwner,
      'link': instance.link,
      'securityName': instance.securityName,
      'formType': instance.formType,
      'securitiesOwned': instance.securitiesOwned,
      'acquisitionDisposition': instance.acquisitionDisposition,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$TradeStatsImpl _$$TradeStatsImplFromJson(Map<String, dynamic> json) =>
    _$TradeStatsImpl(
      id: json['id'] as String,
      date: DateTime.parse(json['date'] as String),
      totalTrades: (json['totalTrades'] as num).toInt(),
      buyCount: (json['buyCount'] as num).toInt(),
      sellCount: (json['sellCount'] as num).toInt(),
      totalBuyValue: (json['totalBuyValue'] as num).toDouble(),
      totalSellValue: (json['totalSellValue'] as num).toDouble(),
      uniqueSymbols: (json['uniqueSymbols'] as num).toInt(),
      period: json['period'] as String,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$TradeStatsImplToJson(_$TradeStatsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'totalTrades': instance.totalTrades,
      'buyCount': instance.buyCount,
      'sellCount': instance.sellCount,
      'totalBuyValue': instance.totalBuyValue,
      'totalSellValue': instance.totalSellValue,
      'uniqueSymbols': instance.uniqueSymbols,
      'period': instance.period,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$WatchlistStockImpl _$$WatchlistStockImplFromJson(Map<String, dynamic> json) =>
    _$WatchlistStockImpl(
      id: json['id'] as String,
      symbol: json['symbol'] as String,
      clusterAnalysisId: json['clusterAnalysisId'] as String,
      entryDate: DateTime.parse(json['entryDate'] as String),
      insiderAvgPrice: (json['insiderAvgPrice'] as num).toDouble(),
      currentPrice: (json['currentPrice'] as num).toDouble(),
      priceChangePct: (json['priceChangePct'] as num).toDouble(),
      daysWatched: (json['daysWatched'] as num).toInt(),
      analysisReasoning: json['analysisReasoning'] as String,
      keyFactors: (json['keyFactors'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      secFilingUrls: (json['secFilingUrls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      newsUrls:
          (json['newsUrls'] as List<dynamic>).map((e) => e as String).toList(),
      status: json['status'] as String,
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
      priceHistory: (json['priceHistory'] as List<dynamic>)
          .map((e) => PricePoint.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WatchlistStockImplToJson(
        _$WatchlistStockImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'clusterAnalysisId': instance.clusterAnalysisId,
      'entryDate': instance.entryDate.toIso8601String(),
      'insiderAvgPrice': instance.insiderAvgPrice,
      'currentPrice': instance.currentPrice,
      'priceChangePct': instance.priceChangePct,
      'daysWatched': instance.daysWatched,
      'analysisReasoning': instance.analysisReasoning,
      'keyFactors': instance.keyFactors,
      'secFilingUrls': instance.secFilingUrls,
      'newsUrls': instance.newsUrls,
      'status': instance.status,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
      'priceHistory': instance.priceHistory,
    };

_$PricePointImpl _$$PricePointImplFromJson(Map<String, dynamic> json) =>
    _$PricePointImpl(
      date: json['date'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$PricePointImplToJson(_$PricePointImpl instance) =>
    <String, dynamic>{
      'date': instance.date,
      'price': instance.price,
    };

_$WatchlistHistoryImpl _$$WatchlistHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$WatchlistHistoryImpl(
      id: json['id'] as String,
      watchListId: json['watchListId'] as String,
      symbol: json['symbol'] as String,
      entryDate: DateTime.parse(json['entryDate'] as String),
      exitDate: DateTime.parse(json['exitDate'] as String),
      insiderAvgPrice: (json['insiderAvgPrice'] as num).toDouble(),
      exitPrice: (json['exitPrice'] as num).toDouble(),
      totalReturnPct: (json['totalReturnPct'] as num).toDouble(),
      daysWatched: (json['daysWatched'] as num).toInt(),
      originalAnalysis: json['originalAnalysis'] as String?,
      exitReason: json['exitReason'] as String?,
      secFilingUrls: (json['secFilingUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      newsUrls: (json['newsUrls'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$$WatchlistHistoryImplToJson(
        _$WatchlistHistoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'watchListId': instance.watchListId,
      'symbol': instance.symbol,
      'entryDate': instance.entryDate.toIso8601String(),
      'exitDate': instance.exitDate.toIso8601String(),
      'insiderAvgPrice': instance.insiderAvgPrice,
      'exitPrice': instance.exitPrice,
      'totalReturnPct': instance.totalReturnPct,
      'daysWatched': instance.daysWatched,
      'originalAnalysis': instance.originalAnalysis,
      'exitReason': instance.exitReason,
      'secFilingUrls': instance.secFilingUrls,
      'newsUrls': instance.newsUrls,
      'createdAt': instance.createdAt?.toIso8601String(),
    };

_$WatchlistSummaryImpl _$$WatchlistSummaryImplFromJson(
        Map<String, dynamic> json) =>
    _$WatchlistSummaryImpl(
      totalStocks: (json['totalStocks'] as num).toInt(),
      activeSignals: (json['activeSignals'] as num).toInt(),
      averageReturn: (json['averageReturn'] as num).toDouble(),
      profitablePositions: (json['profitablePositions'] as num).toInt(),
      bestPerformer: (json['bestPerformer'] as num).toDouble(),
      bestSymbol: json['bestSymbol'] as String,
      totalValue: (json['totalValue'] as num).toDouble(),
      realizedGain: (json['realizedGain'] as num?)?.toDouble() ?? 0.0,
      unrealizedGain: (json['unrealizedGain'] as num?)?.toDouble() ?? 0.0,
      sectorAllocation:
          (json['sectorAllocation'] as Map<String, dynamic>?)?.map(
                (k, e) => MapEntry(k, (e as num).toDouble()),
              ) ??
              const {},
      totalTransactions: (json['totalTransactions'] as num?)?.toInt() ?? 0,
      averageTransactionSize:
          (json['averageTransactionSize'] as num?)?.toDouble() ?? 0.0,
      lastUpdated: json['lastUpdated'] == null
          ? null
          : DateTime.parse(json['lastUpdated'] as String),
      topPerformers: (json['topPerformers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      recentlyAdded: (json['recentlyAdded'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$WatchlistSummaryImplToJson(
        _$WatchlistSummaryImpl instance) =>
    <String, dynamic>{
      'totalStocks': instance.totalStocks,
      'activeSignals': instance.activeSignals,
      'averageReturn': instance.averageReturn,
      'profitablePositions': instance.profitablePositions,
      'bestPerformer': instance.bestPerformer,
      'bestSymbol': instance.bestSymbol,
      'totalValue': instance.totalValue,
      'realizedGain': instance.realizedGain,
      'unrealizedGain': instance.unrealizedGain,
      'sectorAllocation': instance.sectorAllocation,
      'totalTransactions': instance.totalTransactions,
      'averageTransactionSize': instance.averageTransactionSize,
      'lastUpdated': instance.lastUpdated?.toIso8601String(),
      'topPerformers': instance.topPerformers,
      'recentlyAdded': instance.recentlyAdded,
    };
