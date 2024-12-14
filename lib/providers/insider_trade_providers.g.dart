// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'insider_trade_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$purchaseTransactionsHash() =>
    r'f09fe2f42ceea5a3553ad9bed095e6b8cd8b26f2';

/// See also [purchaseTransactions].
@ProviderFor(purchaseTransactions)
final purchaseTransactionsProvider =
    AutoDisposeFutureProvider<List<InsiderTransaction>>.internal(
  purchaseTransactions,
  name: r'purchaseTransactionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$purchaseTransactionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PurchaseTransactionsRef
    = AutoDisposeFutureProviderRef<List<InsiderTransaction>>;
String _$saleTransactionsHash() => r'7e0b72906c7f15382f4a3471d9ac1a9c32c58b42';

/// See also [saleTransactions].
@ProviderFor(saleTransactions)
final saleTransactionsProvider =
    AutoDisposeFutureProvider<List<InsiderTransaction>>.internal(
  saleTransactions,
  name: r'saleTransactionsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$saleTransactionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SaleTransactionsRef
    = AutoDisposeFutureProviderRef<List<InsiderTransaction>>;
String _$transactionStatisticsHash() =>
    r'eea867965d746333cb7becd4d4e7708454e74609';

/// See also [transactionStatistics].
@ProviderFor(transactionStatistics)
final transactionStatisticsProvider =
    AutoDisposeFutureProvider<Map<String, dynamic>>.internal(
  transactionStatistics,
  name: r'transactionStatisticsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionStatisticsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TransactionStatisticsRef
    = AutoDisposeFutureProviderRef<Map<String, dynamic>>;
String _$transactionsBySymbolHash() =>
    r'1455c70e8e0daf9a109c77675b5bfb78ffb06131';

/// See also [transactionsBySymbol].
@ProviderFor(transactionsBySymbol)
final transactionsBySymbolProvider =
    AutoDisposeFutureProvider<Map<String, List<InsiderTransaction>>>.internal(
  transactionsBySymbol,
  name: r'transactionsBySymbolProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$transactionsBySymbolHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TransactionsBySymbolRef
    = AutoDisposeFutureProviderRef<Map<String, List<InsiderTransaction>>>;
String _$periodTradeStatsHash() => r'a8272f2ae28e38e5a605b4a03ee7053ce3b3b125';

/// See also [periodTradeStats].
@ProviderFor(periodTradeStats)
final periodTradeStatsProvider =
    AutoDisposeFutureProvider<TradeStats?>.internal(
  periodTradeStats,
  name: r'periodTradeStatsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$periodTradeStatsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef PeriodTradeStatsRef = AutoDisposeFutureProviderRef<TradeStats?>;
String _$selectedPeriodHash() => r'9a063816b3dccd866927b69d338d1d67dd6fc83a';

/// See also [SelectedPeriod].
@ProviderFor(SelectedPeriod)
final selectedPeriodProvider =
    NotifierProvider<SelectedPeriod, String>.internal(
  SelectedPeriod.new,
  name: r'selectedPeriodProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedPeriodHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedPeriod = Notifier<String>;
String _$watchlistNotifierHash() => r'84739b5fc371a516f1659a9f5ad7bc60c9be4d2c';

/// See also [WatchlistNotifier].
@ProviderFor(WatchlistNotifier)
final watchlistNotifierProvider =
    AsyncNotifierProvider<WatchlistNotifier, List<WatchlistStock>>.internal(
  WatchlistNotifier.new,
  name: r'watchlistNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$watchlistNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WatchlistNotifier = AsyncNotifier<List<WatchlistStock>>;
String _$recentTransactionsNotifierHash() =>
    r'8e8810b5bae4c19ccbfd3aebe40888d9760b3ab9';

/// See also [RecentTransactionsNotifier].
@ProviderFor(RecentTransactionsNotifier)
final recentTransactionsNotifierProvider = AsyncNotifierProvider<
    RecentTransactionsNotifier, List<InsiderTransaction>>.internal(
  RecentTransactionsNotifier.new,
  name: r'recentTransactionsNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$recentTransactionsNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$RecentTransactionsNotifier = AsyncNotifier<List<InsiderTransaction>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
