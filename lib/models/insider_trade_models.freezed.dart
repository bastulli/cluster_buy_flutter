// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'insider_trade_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ClusterDetection _$ClusterDetectionFromJson(Map<String, dynamic> json) {
  return _ClusterDetection.fromJson(json);
}

/// @nodoc
mixin _$ClusterDetection {
  String get id => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  DateTime get clusterStartDate => throw _privateConstructorUsedError;
  DateTime get clusterEndDate => throw _privateConstructorUsedError;
  double get totalValue => throw _privateConstructorUsedError;
  int get buyerCount => throw _privateConstructorUsedError;
  int get transactionCount => throw _privateConstructorUsedError;
  double get insiderAvgPrice => throw _privateConstructorUsedError;
  DateTime get detectedAt => throw _privateConstructorUsedError;
  bool get scannedByAi => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ClusterDetection to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClusterDetection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClusterDetectionCopyWith<ClusterDetection> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClusterDetectionCopyWith<$Res> {
  factory $ClusterDetectionCopyWith(
          ClusterDetection value, $Res Function(ClusterDetection) then) =
      _$ClusterDetectionCopyWithImpl<$Res, ClusterDetection>;
  @useResult
  $Res call(
      {String id,
      String symbol,
      DateTime clusterStartDate,
      DateTime clusterEndDate,
      double totalValue,
      int buyerCount,
      int transactionCount,
      double insiderAvgPrice,
      DateTime detectedAt,
      bool scannedByAi,
      DateTime? createdAt});
}

/// @nodoc
class _$ClusterDetectionCopyWithImpl<$Res, $Val extends ClusterDetection>
    implements $ClusterDetectionCopyWith<$Res> {
  _$ClusterDetectionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClusterDetection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? clusterStartDate = null,
    Object? clusterEndDate = null,
    Object? totalValue = null,
    Object? buyerCount = null,
    Object? transactionCount = null,
    Object? insiderAvgPrice = null,
    Object? detectedAt = null,
    Object? scannedByAi = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      clusterStartDate: null == clusterStartDate
          ? _value.clusterStartDate
          : clusterStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      clusterEndDate: null == clusterEndDate
          ? _value.clusterEndDate
          : clusterEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      buyerCount: null == buyerCount
          ? _value.buyerCount
          : buyerCount // ignore: cast_nullable_to_non_nullable
              as int,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
      insiderAvgPrice: null == insiderAvgPrice
          ? _value.insiderAvgPrice
          : insiderAvgPrice // ignore: cast_nullable_to_non_nullable
              as double,
      detectedAt: null == detectedAt
          ? _value.detectedAt
          : detectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scannedByAi: null == scannedByAi
          ? _value.scannedByAi
          : scannedByAi // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClusterDetectionImplCopyWith<$Res>
    implements $ClusterDetectionCopyWith<$Res> {
  factory _$$ClusterDetectionImplCopyWith(_$ClusterDetectionImpl value,
          $Res Function(_$ClusterDetectionImpl) then) =
      __$$ClusterDetectionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String symbol,
      DateTime clusterStartDate,
      DateTime clusterEndDate,
      double totalValue,
      int buyerCount,
      int transactionCount,
      double insiderAvgPrice,
      DateTime detectedAt,
      bool scannedByAi,
      DateTime? createdAt});
}

/// @nodoc
class __$$ClusterDetectionImplCopyWithImpl<$Res>
    extends _$ClusterDetectionCopyWithImpl<$Res, _$ClusterDetectionImpl>
    implements _$$ClusterDetectionImplCopyWith<$Res> {
  __$$ClusterDetectionImplCopyWithImpl(_$ClusterDetectionImpl _value,
      $Res Function(_$ClusterDetectionImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClusterDetection
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? clusterStartDate = null,
    Object? clusterEndDate = null,
    Object? totalValue = null,
    Object? buyerCount = null,
    Object? transactionCount = null,
    Object? insiderAvgPrice = null,
    Object? detectedAt = null,
    Object? scannedByAi = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$ClusterDetectionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      clusterStartDate: null == clusterStartDate
          ? _value.clusterStartDate
          : clusterStartDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      clusterEndDate: null == clusterEndDate
          ? _value.clusterEndDate
          : clusterEndDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      buyerCount: null == buyerCount
          ? _value.buyerCount
          : buyerCount // ignore: cast_nullable_to_non_nullable
              as int,
      transactionCount: null == transactionCount
          ? _value.transactionCount
          : transactionCount // ignore: cast_nullable_to_non_nullable
              as int,
      insiderAvgPrice: null == insiderAvgPrice
          ? _value.insiderAvgPrice
          : insiderAvgPrice // ignore: cast_nullable_to_non_nullable
              as double,
      detectedAt: null == detectedAt
          ? _value.detectedAt
          : detectedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      scannedByAi: null == scannedByAi
          ? _value.scannedByAi
          : scannedByAi // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ClusterDetectionImpl implements _ClusterDetection {
  const _$ClusterDetectionImpl(
      {required this.id,
      required this.symbol,
      required this.clusterStartDate,
      required this.clusterEndDate,
      required this.totalValue,
      required this.buyerCount,
      required this.transactionCount,
      required this.insiderAvgPrice,
      required this.detectedAt,
      this.scannedByAi = false,
      this.createdAt});

  factory _$ClusterDetectionImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClusterDetectionImplFromJson(json);

  @override
  final String id;
  @override
  final String symbol;
  @override
  final DateTime clusterStartDate;
  @override
  final DateTime clusterEndDate;
  @override
  final double totalValue;
  @override
  final int buyerCount;
  @override
  final int transactionCount;
  @override
  final double insiderAvgPrice;
  @override
  final DateTime detectedAt;
  @override
  @JsonKey()
  final bool scannedByAi;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'ClusterDetection(id: $id, symbol: $symbol, clusterStartDate: $clusterStartDate, clusterEndDate: $clusterEndDate, totalValue: $totalValue, buyerCount: $buyerCount, transactionCount: $transactionCount, insiderAvgPrice: $insiderAvgPrice, detectedAt: $detectedAt, scannedByAi: $scannedByAi, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClusterDetectionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.clusterStartDate, clusterStartDate) ||
                other.clusterStartDate == clusterStartDate) &&
            (identical(other.clusterEndDate, clusterEndDate) ||
                other.clusterEndDate == clusterEndDate) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.buyerCount, buyerCount) ||
                other.buyerCount == buyerCount) &&
            (identical(other.transactionCount, transactionCount) ||
                other.transactionCount == transactionCount) &&
            (identical(other.insiderAvgPrice, insiderAvgPrice) ||
                other.insiderAvgPrice == insiderAvgPrice) &&
            (identical(other.detectedAt, detectedAt) ||
                other.detectedAt == detectedAt) &&
            (identical(other.scannedByAi, scannedByAi) ||
                other.scannedByAi == scannedByAi) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      symbol,
      clusterStartDate,
      clusterEndDate,
      totalValue,
      buyerCount,
      transactionCount,
      insiderAvgPrice,
      detectedAt,
      scannedByAi,
      createdAt);

  /// Create a copy of ClusterDetection
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClusterDetectionImplCopyWith<_$ClusterDetectionImpl> get copyWith =>
      __$$ClusterDetectionImplCopyWithImpl<_$ClusterDetectionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClusterDetectionImplToJson(
      this,
    );
  }
}

abstract class _ClusterDetection implements ClusterDetection {
  const factory _ClusterDetection(
      {required final String id,
      required final String symbol,
      required final DateTime clusterStartDate,
      required final DateTime clusterEndDate,
      required final double totalValue,
      required final int buyerCount,
      required final int transactionCount,
      required final double insiderAvgPrice,
      required final DateTime detectedAt,
      final bool scannedByAi,
      final DateTime? createdAt}) = _$ClusterDetectionImpl;

  factory _ClusterDetection.fromJson(Map<String, dynamic> json) =
      _$ClusterDetectionImpl.fromJson;

  @override
  String get id;
  @override
  String get symbol;
  @override
  DateTime get clusterStartDate;
  @override
  DateTime get clusterEndDate;
  @override
  double get totalValue;
  @override
  int get buyerCount;
  @override
  int get transactionCount;
  @override
  double get insiderAvgPrice;
  @override
  DateTime get detectedAt;
  @override
  bool get scannedByAi;
  @override
  DateTime? get createdAt;

  /// Create a copy of ClusterDetection
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClusterDetectionImplCopyWith<_$ClusterDetectionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TradeStats _$TradeStatsFromJson(Map<String, dynamic> json) {
  return _TradeStats.fromJson(json);
}

/// @nodoc
mixin _$TradeStats {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;
  int get totalTrades => throw _privateConstructorUsedError;
  int get buyCount => throw _privateConstructorUsedError;
  int get sellCount => throw _privateConstructorUsedError;
  double get totalBuyValue => throw _privateConstructorUsedError;
  double get totalSellValue => throw _privateConstructorUsedError;
  double get buySecurities => throw _privateConstructorUsedError;
  double get sellSecurities => throw _privateConstructorUsedError;
  int get uniqueBuyers => throw _privateConstructorUsedError;
  int get uniqueSellers => throw _privateConstructorUsedError;
  int get uniqueSymbols => throw _privateConstructorUsedError;
  int get buySymbols => throw _privateConstructorUsedError;
  int get sellSymbols => throw _privateConstructorUsedError;
  double get buyRatio => throw _privateConstructorUsedError;
  double get sellRatio => throw _privateConstructorUsedError;
  double get avgBuyValue => throw _privateConstructorUsedError;
  double get avgSellValue => throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get topBuySymbols =>
      throw _privateConstructorUsedError;
  List<Map<String, dynamic>> get topSellSymbols =>
      throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this TradeStats to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of TradeStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TradeStatsCopyWith<TradeStats> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TradeStatsCopyWith<$Res> {
  factory $TradeStatsCopyWith(
          TradeStats value, $Res Function(TradeStats) then) =
      _$TradeStatsCopyWithImpl<$Res, TradeStats>;
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String period,
      int totalTrades,
      int buyCount,
      int sellCount,
      double totalBuyValue,
      double totalSellValue,
      double buySecurities,
      double sellSecurities,
      int uniqueBuyers,
      int uniqueSellers,
      int uniqueSymbols,
      int buySymbols,
      int sellSymbols,
      double buyRatio,
      double sellRatio,
      double avgBuyValue,
      double avgSellValue,
      List<Map<String, dynamic>> topBuySymbols,
      List<Map<String, dynamic>> topSellSymbols,
      DateTime createdAt});
}

/// @nodoc
class _$TradeStatsCopyWithImpl<$Res, $Val extends TradeStats>
    implements $TradeStatsCopyWith<$Res> {
  _$TradeStatsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TradeStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? period = null,
    Object? totalTrades = null,
    Object? buyCount = null,
    Object? sellCount = null,
    Object? totalBuyValue = null,
    Object? totalSellValue = null,
    Object? buySecurities = null,
    Object? sellSecurities = null,
    Object? uniqueBuyers = null,
    Object? uniqueSellers = null,
    Object? uniqueSymbols = null,
    Object? buySymbols = null,
    Object? sellSymbols = null,
    Object? buyRatio = null,
    Object? sellRatio = null,
    Object? avgBuyValue = null,
    Object? avgSellValue = null,
    Object? topBuySymbols = null,
    Object? topSellSymbols = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      totalTrades: null == totalTrades
          ? _value.totalTrades
          : totalTrades // ignore: cast_nullable_to_non_nullable
              as int,
      buyCount: null == buyCount
          ? _value.buyCount
          : buyCount // ignore: cast_nullable_to_non_nullable
              as int,
      sellCount: null == sellCount
          ? _value.sellCount
          : sellCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalBuyValue: null == totalBuyValue
          ? _value.totalBuyValue
          : totalBuyValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalSellValue: null == totalSellValue
          ? _value.totalSellValue
          : totalSellValue // ignore: cast_nullable_to_non_nullable
              as double,
      buySecurities: null == buySecurities
          ? _value.buySecurities
          : buySecurities // ignore: cast_nullable_to_non_nullable
              as double,
      sellSecurities: null == sellSecurities
          ? _value.sellSecurities
          : sellSecurities // ignore: cast_nullable_to_non_nullable
              as double,
      uniqueBuyers: null == uniqueBuyers
          ? _value.uniqueBuyers
          : uniqueBuyers // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueSellers: null == uniqueSellers
          ? _value.uniqueSellers
          : uniqueSellers // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueSymbols: null == uniqueSymbols
          ? _value.uniqueSymbols
          : uniqueSymbols // ignore: cast_nullable_to_non_nullable
              as int,
      buySymbols: null == buySymbols
          ? _value.buySymbols
          : buySymbols // ignore: cast_nullable_to_non_nullable
              as int,
      sellSymbols: null == sellSymbols
          ? _value.sellSymbols
          : sellSymbols // ignore: cast_nullable_to_non_nullable
              as int,
      buyRatio: null == buyRatio
          ? _value.buyRatio
          : buyRatio // ignore: cast_nullable_to_non_nullable
              as double,
      sellRatio: null == sellRatio
          ? _value.sellRatio
          : sellRatio // ignore: cast_nullable_to_non_nullable
              as double,
      avgBuyValue: null == avgBuyValue
          ? _value.avgBuyValue
          : avgBuyValue // ignore: cast_nullable_to_non_nullable
              as double,
      avgSellValue: null == avgSellValue
          ? _value.avgSellValue
          : avgSellValue // ignore: cast_nullable_to_non_nullable
              as double,
      topBuySymbols: null == topBuySymbols
          ? _value.topBuySymbols
          : topBuySymbols // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      topSellSymbols: null == topSellSymbols
          ? _value.topSellSymbols
          : topSellSymbols // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TradeStatsImplCopyWith<$Res>
    implements $TradeStatsCopyWith<$Res> {
  factory _$$TradeStatsImplCopyWith(
          _$TradeStatsImpl value, $Res Function(_$TradeStatsImpl) then) =
      __$$TradeStatsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime date,
      String period,
      int totalTrades,
      int buyCount,
      int sellCount,
      double totalBuyValue,
      double totalSellValue,
      double buySecurities,
      double sellSecurities,
      int uniqueBuyers,
      int uniqueSellers,
      int uniqueSymbols,
      int buySymbols,
      int sellSymbols,
      double buyRatio,
      double sellRatio,
      double avgBuyValue,
      double avgSellValue,
      List<Map<String, dynamic>> topBuySymbols,
      List<Map<String, dynamic>> topSellSymbols,
      DateTime createdAt});
}

/// @nodoc
class __$$TradeStatsImplCopyWithImpl<$Res>
    extends _$TradeStatsCopyWithImpl<$Res, _$TradeStatsImpl>
    implements _$$TradeStatsImplCopyWith<$Res> {
  __$$TradeStatsImplCopyWithImpl(
      _$TradeStatsImpl _value, $Res Function(_$TradeStatsImpl) _then)
      : super(_value, _then);

  /// Create a copy of TradeStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? date = null,
    Object? period = null,
    Object? totalTrades = null,
    Object? buyCount = null,
    Object? sellCount = null,
    Object? totalBuyValue = null,
    Object? totalSellValue = null,
    Object? buySecurities = null,
    Object? sellSecurities = null,
    Object? uniqueBuyers = null,
    Object? uniqueSellers = null,
    Object? uniqueSymbols = null,
    Object? buySymbols = null,
    Object? sellSymbols = null,
    Object? buyRatio = null,
    Object? sellRatio = null,
    Object? avgBuyValue = null,
    Object? avgSellValue = null,
    Object? topBuySymbols = null,
    Object? topSellSymbols = null,
    Object? createdAt = null,
  }) {
    return _then(_$TradeStatsImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      totalTrades: null == totalTrades
          ? _value.totalTrades
          : totalTrades // ignore: cast_nullable_to_non_nullable
              as int,
      buyCount: null == buyCount
          ? _value.buyCount
          : buyCount // ignore: cast_nullable_to_non_nullable
              as int,
      sellCount: null == sellCount
          ? _value.sellCount
          : sellCount // ignore: cast_nullable_to_non_nullable
              as int,
      totalBuyValue: null == totalBuyValue
          ? _value.totalBuyValue
          : totalBuyValue // ignore: cast_nullable_to_non_nullable
              as double,
      totalSellValue: null == totalSellValue
          ? _value.totalSellValue
          : totalSellValue // ignore: cast_nullable_to_non_nullable
              as double,
      buySecurities: null == buySecurities
          ? _value.buySecurities
          : buySecurities // ignore: cast_nullable_to_non_nullable
              as double,
      sellSecurities: null == sellSecurities
          ? _value.sellSecurities
          : sellSecurities // ignore: cast_nullable_to_non_nullable
              as double,
      uniqueBuyers: null == uniqueBuyers
          ? _value.uniqueBuyers
          : uniqueBuyers // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueSellers: null == uniqueSellers
          ? _value.uniqueSellers
          : uniqueSellers // ignore: cast_nullable_to_non_nullable
              as int,
      uniqueSymbols: null == uniqueSymbols
          ? _value.uniqueSymbols
          : uniqueSymbols // ignore: cast_nullable_to_non_nullable
              as int,
      buySymbols: null == buySymbols
          ? _value.buySymbols
          : buySymbols // ignore: cast_nullable_to_non_nullable
              as int,
      sellSymbols: null == sellSymbols
          ? _value.sellSymbols
          : sellSymbols // ignore: cast_nullable_to_non_nullable
              as int,
      buyRatio: null == buyRatio
          ? _value.buyRatio
          : buyRatio // ignore: cast_nullable_to_non_nullable
              as double,
      sellRatio: null == sellRatio
          ? _value.sellRatio
          : sellRatio // ignore: cast_nullable_to_non_nullable
              as double,
      avgBuyValue: null == avgBuyValue
          ? _value.avgBuyValue
          : avgBuyValue // ignore: cast_nullable_to_non_nullable
              as double,
      avgSellValue: null == avgSellValue
          ? _value.avgSellValue
          : avgSellValue // ignore: cast_nullable_to_non_nullable
              as double,
      topBuySymbols: null == topBuySymbols
          ? _value._topBuySymbols
          : topBuySymbols // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      topSellSymbols: null == topSellSymbols
          ? _value._topSellSymbols
          : topSellSymbols // ignore: cast_nullable_to_non_nullable
              as List<Map<String, dynamic>>,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TradeStatsImpl implements _TradeStats {
  const _$TradeStatsImpl(
      {required this.id,
      required this.date,
      required this.period,
      required this.totalTrades,
      required this.buyCount,
      required this.sellCount,
      required this.totalBuyValue,
      required this.totalSellValue,
      required this.buySecurities,
      required this.sellSecurities,
      required this.uniqueBuyers,
      required this.uniqueSellers,
      required this.uniqueSymbols,
      required this.buySymbols,
      required this.sellSymbols,
      required this.buyRatio,
      required this.sellRatio,
      required this.avgBuyValue,
      required this.avgSellValue,
      required final List<Map<String, dynamic>> topBuySymbols,
      required final List<Map<String, dynamic>> topSellSymbols,
      required this.createdAt})
      : _topBuySymbols = topBuySymbols,
        _topSellSymbols = topSellSymbols;

  factory _$TradeStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TradeStatsImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
  @override
  final String period;
  @override
  final int totalTrades;
  @override
  final int buyCount;
  @override
  final int sellCount;
  @override
  final double totalBuyValue;
  @override
  final double totalSellValue;
  @override
  final double buySecurities;
  @override
  final double sellSecurities;
  @override
  final int uniqueBuyers;
  @override
  final int uniqueSellers;
  @override
  final int uniqueSymbols;
  @override
  final int buySymbols;
  @override
  final int sellSymbols;
  @override
  final double buyRatio;
  @override
  final double sellRatio;
  @override
  final double avgBuyValue;
  @override
  final double avgSellValue;
  final List<Map<String, dynamic>> _topBuySymbols;
  @override
  List<Map<String, dynamic>> get topBuySymbols {
    if (_topBuySymbols is EqualUnmodifiableListView) return _topBuySymbols;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topBuySymbols);
  }

  final List<Map<String, dynamic>> _topSellSymbols;
  @override
  List<Map<String, dynamic>> get topSellSymbols {
    if (_topSellSymbols is EqualUnmodifiableListView) return _topSellSymbols;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topSellSymbols);
  }

  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'TradeStats(id: $id, date: $date, period: $period, totalTrades: $totalTrades, buyCount: $buyCount, sellCount: $sellCount, totalBuyValue: $totalBuyValue, totalSellValue: $totalSellValue, buySecurities: $buySecurities, sellSecurities: $sellSecurities, uniqueBuyers: $uniqueBuyers, uniqueSellers: $uniqueSellers, uniqueSymbols: $uniqueSymbols, buySymbols: $buySymbols, sellSymbols: $sellSymbols, buyRatio: $buyRatio, sellRatio: $sellRatio, avgBuyValue: $avgBuyValue, avgSellValue: $avgSellValue, topBuySymbols: $topBuySymbols, topSellSymbols: $topSellSymbols, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TradeStatsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.totalTrades, totalTrades) ||
                other.totalTrades == totalTrades) &&
            (identical(other.buyCount, buyCount) ||
                other.buyCount == buyCount) &&
            (identical(other.sellCount, sellCount) ||
                other.sellCount == sellCount) &&
            (identical(other.totalBuyValue, totalBuyValue) ||
                other.totalBuyValue == totalBuyValue) &&
            (identical(other.totalSellValue, totalSellValue) ||
                other.totalSellValue == totalSellValue) &&
            (identical(other.buySecurities, buySecurities) ||
                other.buySecurities == buySecurities) &&
            (identical(other.sellSecurities, sellSecurities) ||
                other.sellSecurities == sellSecurities) &&
            (identical(other.uniqueBuyers, uniqueBuyers) ||
                other.uniqueBuyers == uniqueBuyers) &&
            (identical(other.uniqueSellers, uniqueSellers) ||
                other.uniqueSellers == uniqueSellers) &&
            (identical(other.uniqueSymbols, uniqueSymbols) ||
                other.uniqueSymbols == uniqueSymbols) &&
            (identical(other.buySymbols, buySymbols) ||
                other.buySymbols == buySymbols) &&
            (identical(other.sellSymbols, sellSymbols) ||
                other.sellSymbols == sellSymbols) &&
            (identical(other.buyRatio, buyRatio) ||
                other.buyRatio == buyRatio) &&
            (identical(other.sellRatio, sellRatio) ||
                other.sellRatio == sellRatio) &&
            (identical(other.avgBuyValue, avgBuyValue) ||
                other.avgBuyValue == avgBuyValue) &&
            (identical(other.avgSellValue, avgSellValue) ||
                other.avgSellValue == avgSellValue) &&
            const DeepCollectionEquality()
                .equals(other._topBuySymbols, _topBuySymbols) &&
            const DeepCollectionEquality()
                .equals(other._topSellSymbols, _topSellSymbols) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        date,
        period,
        totalTrades,
        buyCount,
        sellCount,
        totalBuyValue,
        totalSellValue,
        buySecurities,
        sellSecurities,
        uniqueBuyers,
        uniqueSellers,
        uniqueSymbols,
        buySymbols,
        sellSymbols,
        buyRatio,
        sellRatio,
        avgBuyValue,
        avgSellValue,
        const DeepCollectionEquality().hash(_topBuySymbols),
        const DeepCollectionEquality().hash(_topSellSymbols),
        createdAt
      ]);

  /// Create a copy of TradeStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TradeStatsImplCopyWith<_$TradeStatsImpl> get copyWith =>
      __$$TradeStatsImplCopyWithImpl<_$TradeStatsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TradeStatsImplToJson(
      this,
    );
  }
}

abstract class _TradeStats implements TradeStats {
  const factory _TradeStats(
      {required final String id,
      required final DateTime date,
      required final String period,
      required final int totalTrades,
      required final int buyCount,
      required final int sellCount,
      required final double totalBuyValue,
      required final double totalSellValue,
      required final double buySecurities,
      required final double sellSecurities,
      required final int uniqueBuyers,
      required final int uniqueSellers,
      required final int uniqueSymbols,
      required final int buySymbols,
      required final int sellSymbols,
      required final double buyRatio,
      required final double sellRatio,
      required final double avgBuyValue,
      required final double avgSellValue,
      required final List<Map<String, dynamic>> topBuySymbols,
      required final List<Map<String, dynamic>> topSellSymbols,
      required final DateTime createdAt}) = _$TradeStatsImpl;

  factory _TradeStats.fromJson(Map<String, dynamic> json) =
      _$TradeStatsImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
  @override
  String get period;
  @override
  int get totalTrades;
  @override
  int get buyCount;
  @override
  int get sellCount;
  @override
  double get totalBuyValue;
  @override
  double get totalSellValue;
  @override
  double get buySecurities;
  @override
  double get sellSecurities;
  @override
  int get uniqueBuyers;
  @override
  int get uniqueSellers;
  @override
  int get uniqueSymbols;
  @override
  int get buySymbols;
  @override
  int get sellSymbols;
  @override
  double get buyRatio;
  @override
  double get sellRatio;
  @override
  double get avgBuyValue;
  @override
  double get avgSellValue;
  @override
  List<Map<String, dynamic>> get topBuySymbols;
  @override
  List<Map<String, dynamic>> get topSellSymbols;
  @override
  DateTime get createdAt;

  /// Create a copy of TradeStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TradeStatsImplCopyWith<_$TradeStatsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WatchlistStock _$WatchlistStockFromJson(Map<String, dynamic> json) {
  return _WatchlistStock.fromJson(json);
}

/// @nodoc
mixin _$WatchlistStock {
  String get id => throw _privateConstructorUsedError; // uuid
  String get symbol => throw _privateConstructorUsedError; // varchar
  String? get clusterAnalysisId => throw _privateConstructorUsedError; // uuid
  DateTime get entryDate => throw _privateConstructorUsedError; // timestamptz
  double get insiderAvgPrice => throw _privateConstructorUsedError; // numeric
  double get currentPrice => throw _privateConstructorUsedError; // numeric
  double get priceChangePct => throw _privateConstructorUsedError; // numeric
  int get daysWatched => throw _privateConstructorUsedError; // int4
  String? get analysisReasoning => throw _privateConstructorUsedError; // text
  List<String>? get keyFactors => throw _privateConstructorUsedError; // _text
  List<String>? get secFilingUrls =>
      throw _privateConstructorUsedError; // _text
  List<String>? get newsUrls => throw _privateConstructorUsedError; // _text
  String get status => throw _privateConstructorUsedError; // varchar
  DateTime get lastUpdated => throw _privateConstructorUsedError; // timestamptz
  int get avgDaysSinceLastBuy => throw _privateConstructorUsedError; // int4
  List<String>? get tradeDates => throw _privateConstructorUsedError; // _text
  List<PricePoint> get priceHistory => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this WatchlistStock to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WatchlistStock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WatchlistStockCopyWith<WatchlistStock> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistStockCopyWith<$Res> {
  factory $WatchlistStockCopyWith(
          WatchlistStock value, $Res Function(WatchlistStock) then) =
      _$WatchlistStockCopyWithImpl<$Res, WatchlistStock>;
  @useResult
  $Res call(
      {String id,
      String symbol,
      String? clusterAnalysisId,
      DateTime entryDate,
      double insiderAvgPrice,
      double currentPrice,
      double priceChangePct,
      int daysWatched,
      String? analysisReasoning,
      List<String>? keyFactors,
      List<String>? secFilingUrls,
      List<String>? newsUrls,
      String status,
      DateTime lastUpdated,
      int avgDaysSinceLastBuy,
      List<String>? tradeDates,
      List<PricePoint> priceHistory,
      DateTime? createdAt});
}

/// @nodoc
class _$WatchlistStockCopyWithImpl<$Res, $Val extends WatchlistStock>
    implements $WatchlistStockCopyWith<$Res> {
  _$WatchlistStockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WatchlistStock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? clusterAnalysisId = freezed,
    Object? entryDate = null,
    Object? insiderAvgPrice = null,
    Object? currentPrice = null,
    Object? priceChangePct = null,
    Object? daysWatched = null,
    Object? analysisReasoning = freezed,
    Object? keyFactors = freezed,
    Object? secFilingUrls = freezed,
    Object? newsUrls = freezed,
    Object? status = null,
    Object? lastUpdated = null,
    Object? avgDaysSinceLastBuy = null,
    Object? tradeDates = freezed,
    Object? priceHistory = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      clusterAnalysisId: freezed == clusterAnalysisId
          ? _value.clusterAnalysisId
          : clusterAnalysisId // ignore: cast_nullable_to_non_nullable
              as String?,
      entryDate: null == entryDate
          ? _value.entryDate
          : entryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      insiderAvgPrice: null == insiderAvgPrice
          ? _value.insiderAvgPrice
          : insiderAvgPrice // ignore: cast_nullable_to_non_nullable
              as double,
      currentPrice: null == currentPrice
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as double,
      priceChangePct: null == priceChangePct
          ? _value.priceChangePct
          : priceChangePct // ignore: cast_nullable_to_non_nullable
              as double,
      daysWatched: null == daysWatched
          ? _value.daysWatched
          : daysWatched // ignore: cast_nullable_to_non_nullable
              as int,
      analysisReasoning: freezed == analysisReasoning
          ? _value.analysisReasoning
          : analysisReasoning // ignore: cast_nullable_to_non_nullable
              as String?,
      keyFactors: freezed == keyFactors
          ? _value.keyFactors
          : keyFactors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      secFilingUrls: freezed == secFilingUrls
          ? _value.secFilingUrls
          : secFilingUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      newsUrls: freezed == newsUrls
          ? _value.newsUrls
          : newsUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      avgDaysSinceLastBuy: null == avgDaysSinceLastBuy
          ? _value.avgDaysSinceLastBuy
          : avgDaysSinceLastBuy // ignore: cast_nullable_to_non_nullable
              as int,
      tradeDates: freezed == tradeDates
          ? _value.tradeDates
          : tradeDates // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      priceHistory: null == priceHistory
          ? _value.priceHistory
          : priceHistory // ignore: cast_nullable_to_non_nullable
              as List<PricePoint>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WatchlistStockImplCopyWith<$Res>
    implements $WatchlistStockCopyWith<$Res> {
  factory _$$WatchlistStockImplCopyWith(_$WatchlistStockImpl value,
          $Res Function(_$WatchlistStockImpl) then) =
      __$$WatchlistStockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String symbol,
      String? clusterAnalysisId,
      DateTime entryDate,
      double insiderAvgPrice,
      double currentPrice,
      double priceChangePct,
      int daysWatched,
      String? analysisReasoning,
      List<String>? keyFactors,
      List<String>? secFilingUrls,
      List<String>? newsUrls,
      String status,
      DateTime lastUpdated,
      int avgDaysSinceLastBuy,
      List<String>? tradeDates,
      List<PricePoint> priceHistory,
      DateTime? createdAt});
}

/// @nodoc
class __$$WatchlistStockImplCopyWithImpl<$Res>
    extends _$WatchlistStockCopyWithImpl<$Res, _$WatchlistStockImpl>
    implements _$$WatchlistStockImplCopyWith<$Res> {
  __$$WatchlistStockImplCopyWithImpl(
      _$WatchlistStockImpl _value, $Res Function(_$WatchlistStockImpl) _then)
      : super(_value, _then);

  /// Create a copy of WatchlistStock
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? clusterAnalysisId = freezed,
    Object? entryDate = null,
    Object? insiderAvgPrice = null,
    Object? currentPrice = null,
    Object? priceChangePct = null,
    Object? daysWatched = null,
    Object? analysisReasoning = freezed,
    Object? keyFactors = freezed,
    Object? secFilingUrls = freezed,
    Object? newsUrls = freezed,
    Object? status = null,
    Object? lastUpdated = null,
    Object? avgDaysSinceLastBuy = null,
    Object? tradeDates = freezed,
    Object? priceHistory = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$WatchlistStockImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      clusterAnalysisId: freezed == clusterAnalysisId
          ? _value.clusterAnalysisId
          : clusterAnalysisId // ignore: cast_nullable_to_non_nullable
              as String?,
      entryDate: null == entryDate
          ? _value.entryDate
          : entryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      insiderAvgPrice: null == insiderAvgPrice
          ? _value.insiderAvgPrice
          : insiderAvgPrice // ignore: cast_nullable_to_non_nullable
              as double,
      currentPrice: null == currentPrice
          ? _value.currentPrice
          : currentPrice // ignore: cast_nullable_to_non_nullable
              as double,
      priceChangePct: null == priceChangePct
          ? _value.priceChangePct
          : priceChangePct // ignore: cast_nullable_to_non_nullable
              as double,
      daysWatched: null == daysWatched
          ? _value.daysWatched
          : daysWatched // ignore: cast_nullable_to_non_nullable
              as int,
      analysisReasoning: freezed == analysisReasoning
          ? _value.analysisReasoning
          : analysisReasoning // ignore: cast_nullable_to_non_nullable
              as String?,
      keyFactors: freezed == keyFactors
          ? _value._keyFactors
          : keyFactors // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      secFilingUrls: freezed == secFilingUrls
          ? _value._secFilingUrls
          : secFilingUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      newsUrls: freezed == newsUrls
          ? _value._newsUrls
          : newsUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      avgDaysSinceLastBuy: null == avgDaysSinceLastBuy
          ? _value.avgDaysSinceLastBuy
          : avgDaysSinceLastBuy // ignore: cast_nullable_to_non_nullable
              as int,
      tradeDates: freezed == tradeDates
          ? _value._tradeDates
          : tradeDates // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      priceHistory: null == priceHistory
          ? _value._priceHistory
          : priceHistory // ignore: cast_nullable_to_non_nullable
              as List<PricePoint>,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchlistStockImpl extends _WatchlistStock {
  const _$WatchlistStockImpl(
      {required this.id,
      required this.symbol,
      this.clusterAnalysisId,
      required this.entryDate,
      required this.insiderAvgPrice,
      required this.currentPrice,
      required this.priceChangePct,
      required this.daysWatched,
      this.analysisReasoning,
      final List<String>? keyFactors,
      final List<String>? secFilingUrls,
      final List<String>? newsUrls,
      required this.status,
      required this.lastUpdated,
      required this.avgDaysSinceLastBuy,
      final List<String>? tradeDates,
      final List<PricePoint> priceHistory = const [],
      this.createdAt})
      : _keyFactors = keyFactors,
        _secFilingUrls = secFilingUrls,
        _newsUrls = newsUrls,
        _tradeDates = tradeDates,
        _priceHistory = priceHistory,
        super._();

  factory _$WatchlistStockImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchlistStockImplFromJson(json);

  @override
  final String id;
// uuid
  @override
  final String symbol;
// varchar
  @override
  final String? clusterAnalysisId;
// uuid
  @override
  final DateTime entryDate;
// timestamptz
  @override
  final double insiderAvgPrice;
// numeric
  @override
  final double currentPrice;
// numeric
  @override
  final double priceChangePct;
// numeric
  @override
  final int daysWatched;
// int4
  @override
  final String? analysisReasoning;
// text
  final List<String>? _keyFactors;
// text
  @override
  List<String>? get keyFactors {
    final value = _keyFactors;
    if (value == null) return null;
    if (_keyFactors is EqualUnmodifiableListView) return _keyFactors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// _text
  final List<String>? _secFilingUrls;
// _text
  @override
  List<String>? get secFilingUrls {
    final value = _secFilingUrls;
    if (value == null) return null;
    if (_secFilingUrls is EqualUnmodifiableListView) return _secFilingUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// _text
  final List<String>? _newsUrls;
// _text
  @override
  List<String>? get newsUrls {
    final value = _newsUrls;
    if (value == null) return null;
    if (_newsUrls is EqualUnmodifiableListView) return _newsUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// _text
  @override
  final String status;
// varchar
  @override
  final DateTime lastUpdated;
// timestamptz
  @override
  final int avgDaysSinceLastBuy;
// int4
  final List<String>? _tradeDates;
// int4
  @override
  List<String>? get tradeDates {
    final value = _tradeDates;
    if (value == null) return null;
    if (_tradeDates is EqualUnmodifiableListView) return _tradeDates;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

// _text
  final List<PricePoint> _priceHistory;
// _text
  @override
  @JsonKey()
  List<PricePoint> get priceHistory {
    if (_priceHistory is EqualUnmodifiableListView) return _priceHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priceHistory);
  }

  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'WatchlistStock(id: $id, symbol: $symbol, clusterAnalysisId: $clusterAnalysisId, entryDate: $entryDate, insiderAvgPrice: $insiderAvgPrice, currentPrice: $currentPrice, priceChangePct: $priceChangePct, daysWatched: $daysWatched, analysisReasoning: $analysisReasoning, keyFactors: $keyFactors, secFilingUrls: $secFilingUrls, newsUrls: $newsUrls, status: $status, lastUpdated: $lastUpdated, avgDaysSinceLastBuy: $avgDaysSinceLastBuy, tradeDates: $tradeDates, priceHistory: $priceHistory, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchlistStockImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.clusterAnalysisId, clusterAnalysisId) ||
                other.clusterAnalysisId == clusterAnalysisId) &&
            (identical(other.entryDate, entryDate) ||
                other.entryDate == entryDate) &&
            (identical(other.insiderAvgPrice, insiderAvgPrice) ||
                other.insiderAvgPrice == insiderAvgPrice) &&
            (identical(other.currentPrice, currentPrice) ||
                other.currentPrice == currentPrice) &&
            (identical(other.priceChangePct, priceChangePct) ||
                other.priceChangePct == priceChangePct) &&
            (identical(other.daysWatched, daysWatched) ||
                other.daysWatched == daysWatched) &&
            (identical(other.analysisReasoning, analysisReasoning) ||
                other.analysisReasoning == analysisReasoning) &&
            const DeepCollectionEquality()
                .equals(other._keyFactors, _keyFactors) &&
            const DeepCollectionEquality()
                .equals(other._secFilingUrls, _secFilingUrls) &&
            const DeepCollectionEquality().equals(other._newsUrls, _newsUrls) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            (identical(other.avgDaysSinceLastBuy, avgDaysSinceLastBuy) ||
                other.avgDaysSinceLastBuy == avgDaysSinceLastBuy) &&
            const DeepCollectionEquality()
                .equals(other._tradeDates, _tradeDates) &&
            const DeepCollectionEquality()
                .equals(other._priceHistory, _priceHistory) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      symbol,
      clusterAnalysisId,
      entryDate,
      insiderAvgPrice,
      currentPrice,
      priceChangePct,
      daysWatched,
      analysisReasoning,
      const DeepCollectionEquality().hash(_keyFactors),
      const DeepCollectionEquality().hash(_secFilingUrls),
      const DeepCollectionEquality().hash(_newsUrls),
      status,
      lastUpdated,
      avgDaysSinceLastBuy,
      const DeepCollectionEquality().hash(_tradeDates),
      const DeepCollectionEquality().hash(_priceHistory),
      createdAt);

  /// Create a copy of WatchlistStock
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchlistStockImplCopyWith<_$WatchlistStockImpl> get copyWith =>
      __$$WatchlistStockImplCopyWithImpl<_$WatchlistStockImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchlistStockImplToJson(
      this,
    );
  }
}

abstract class _WatchlistStock extends WatchlistStock {
  const factory _WatchlistStock(
      {required final String id,
      required final String symbol,
      final String? clusterAnalysisId,
      required final DateTime entryDate,
      required final double insiderAvgPrice,
      required final double currentPrice,
      required final double priceChangePct,
      required final int daysWatched,
      final String? analysisReasoning,
      final List<String>? keyFactors,
      final List<String>? secFilingUrls,
      final List<String>? newsUrls,
      required final String status,
      required final DateTime lastUpdated,
      required final int avgDaysSinceLastBuy,
      final List<String>? tradeDates,
      final List<PricePoint> priceHistory,
      final DateTime? createdAt}) = _$WatchlistStockImpl;
  const _WatchlistStock._() : super._();

  factory _WatchlistStock.fromJson(Map<String, dynamic> json) =
      _$WatchlistStockImpl.fromJson;

  @override
  String get id; // uuid
  @override
  String get symbol; // varchar
  @override
  String? get clusterAnalysisId; // uuid
  @override
  DateTime get entryDate; // timestamptz
  @override
  double get insiderAvgPrice; // numeric
  @override
  double get currentPrice; // numeric
  @override
  double get priceChangePct; // numeric
  @override
  int get daysWatched; // int4
  @override
  String? get analysisReasoning; // text
  @override
  List<String>? get keyFactors; // _text
  @override
  List<String>? get secFilingUrls; // _text
  @override
  List<String>? get newsUrls; // _text
  @override
  String get status; // varchar
  @override
  DateTime get lastUpdated; // timestamptz
  @override
  int get avgDaysSinceLastBuy; // int4
  @override
  List<String>? get tradeDates; // _text
  @override
  List<PricePoint> get priceHistory;
  @override
  DateTime? get createdAt;

  /// Create a copy of WatchlistStock
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WatchlistStockImplCopyWith<_$WatchlistStockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PricePoint _$PricePointFromJson(Map<String, dynamic> json) {
  return _PricePoint.fromJson(json);
}

/// @nodoc
mixin _$PricePoint {
  DateTime get date => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  int? get volume => throw _privateConstructorUsedError;

  /// Serializes this PricePoint to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PricePoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PricePointCopyWith<PricePoint> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PricePointCopyWith<$Res> {
  factory $PricePointCopyWith(
          PricePoint value, $Res Function(PricePoint) then) =
      _$PricePointCopyWithImpl<$Res, PricePoint>;
  @useResult
  $Res call({DateTime date, double price, int? volume});
}

/// @nodoc
class _$PricePointCopyWithImpl<$Res, $Val extends PricePoint>
    implements $PricePointCopyWith<$Res> {
  _$PricePointCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PricePoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? price = null,
    Object? volume = freezed,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PricePointImplCopyWith<$Res>
    implements $PricePointCopyWith<$Res> {
  factory _$$PricePointImplCopyWith(
          _$PricePointImpl value, $Res Function(_$PricePointImpl) then) =
      __$$PricePointImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime date, double price, int? volume});
}

/// @nodoc
class __$$PricePointImplCopyWithImpl<$Res>
    extends _$PricePointCopyWithImpl<$Res, _$PricePointImpl>
    implements _$$PricePointImplCopyWith<$Res> {
  __$$PricePointImplCopyWithImpl(
      _$PricePointImpl _value, $Res Function(_$PricePointImpl) _then)
      : super(_value, _then);

  /// Create a copy of PricePoint
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? price = null,
    Object? volume = freezed,
  }) {
    return _then(_$PricePointImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      volume: freezed == volume
          ? _value.volume
          : volume // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PricePointImpl implements _PricePoint {
  const _$PricePointImpl(
      {required this.date, required this.price, this.volume});

  factory _$PricePointImpl.fromJson(Map<String, dynamic> json) =>
      _$$PricePointImplFromJson(json);

  @override
  final DateTime date;
  @override
  final double price;
  @override
  final int? volume;

  @override
  String toString() {
    return 'PricePoint(date: $date, price: $price, volume: $volume)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PricePointImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.volume, volume) || other.volume == volume));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, price, volume);

  /// Create a copy of PricePoint
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PricePointImplCopyWith<_$PricePointImpl> get copyWith =>
      __$$PricePointImplCopyWithImpl<_$PricePointImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PricePointImplToJson(
      this,
    );
  }
}

abstract class _PricePoint implements PricePoint {
  const factory _PricePoint(
      {required final DateTime date,
      required final double price,
      final int? volume}) = _$PricePointImpl;

  factory _PricePoint.fromJson(Map<String, dynamic> json) =
      _$PricePointImpl.fromJson;

  @override
  DateTime get date;
  @override
  double get price;
  @override
  int? get volume;

  /// Create a copy of PricePoint
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PricePointImplCopyWith<_$PricePointImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WatchlistHistory _$WatchlistHistoryFromJson(Map<String, dynamic> json) {
  return _WatchlistHistory.fromJson(json);
}

/// @nodoc
mixin _$WatchlistHistory {
  String get id => throw _privateConstructorUsedError;
  String? get watchListId => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  DateTime get entryDate => throw _privateConstructorUsedError;
  DateTime get exitDate => throw _privateConstructorUsedError;
  double get insiderAvgPrice => throw _privateConstructorUsedError;
  double get exitPrice => throw _privateConstructorUsedError;
  double get totalReturnPct => throw _privateConstructorUsedError;
  int get daysWatched => throw _privateConstructorUsedError;
  String? get originalAnalysis => throw _privateConstructorUsedError;
  String? get exitReason => throw _privateConstructorUsedError;
  List<String>? get secFilingUrls => throw _privateConstructorUsedError;
  List<String>? get newsUrls => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this WatchlistHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WatchlistHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WatchlistHistoryCopyWith<WatchlistHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistHistoryCopyWith<$Res> {
  factory $WatchlistHistoryCopyWith(
          WatchlistHistory value, $Res Function(WatchlistHistory) then) =
      _$WatchlistHistoryCopyWithImpl<$Res, WatchlistHistory>;
  @useResult
  $Res call(
      {String id,
      String? watchListId,
      String symbol,
      DateTime entryDate,
      DateTime exitDate,
      double insiderAvgPrice,
      double exitPrice,
      double totalReturnPct,
      int daysWatched,
      String? originalAnalysis,
      String? exitReason,
      List<String>? secFilingUrls,
      List<String>? newsUrls,
      DateTime? createdAt});
}

/// @nodoc
class _$WatchlistHistoryCopyWithImpl<$Res, $Val extends WatchlistHistory>
    implements $WatchlistHistoryCopyWith<$Res> {
  _$WatchlistHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WatchlistHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? watchListId = freezed,
    Object? symbol = null,
    Object? entryDate = null,
    Object? exitDate = null,
    Object? insiderAvgPrice = null,
    Object? exitPrice = null,
    Object? totalReturnPct = null,
    Object? daysWatched = null,
    Object? originalAnalysis = freezed,
    Object? exitReason = freezed,
    Object? secFilingUrls = freezed,
    Object? newsUrls = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      watchListId: freezed == watchListId
          ? _value.watchListId
          : watchListId // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      entryDate: null == entryDate
          ? _value.entryDate
          : entryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      exitDate: null == exitDate
          ? _value.exitDate
          : exitDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      insiderAvgPrice: null == insiderAvgPrice
          ? _value.insiderAvgPrice
          : insiderAvgPrice // ignore: cast_nullable_to_non_nullable
              as double,
      exitPrice: null == exitPrice
          ? _value.exitPrice
          : exitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalReturnPct: null == totalReturnPct
          ? _value.totalReturnPct
          : totalReturnPct // ignore: cast_nullable_to_non_nullable
              as double,
      daysWatched: null == daysWatched
          ? _value.daysWatched
          : daysWatched // ignore: cast_nullable_to_non_nullable
              as int,
      originalAnalysis: freezed == originalAnalysis
          ? _value.originalAnalysis
          : originalAnalysis // ignore: cast_nullable_to_non_nullable
              as String?,
      exitReason: freezed == exitReason
          ? _value.exitReason
          : exitReason // ignore: cast_nullable_to_non_nullable
              as String?,
      secFilingUrls: freezed == secFilingUrls
          ? _value.secFilingUrls
          : secFilingUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      newsUrls: freezed == newsUrls
          ? _value.newsUrls
          : newsUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WatchlistHistoryImplCopyWith<$Res>
    implements $WatchlistHistoryCopyWith<$Res> {
  factory _$$WatchlistHistoryImplCopyWith(_$WatchlistHistoryImpl value,
          $Res Function(_$WatchlistHistoryImpl) then) =
      __$$WatchlistHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? watchListId,
      String symbol,
      DateTime entryDate,
      DateTime exitDate,
      double insiderAvgPrice,
      double exitPrice,
      double totalReturnPct,
      int daysWatched,
      String? originalAnalysis,
      String? exitReason,
      List<String>? secFilingUrls,
      List<String>? newsUrls,
      DateTime? createdAt});
}

/// @nodoc
class __$$WatchlistHistoryImplCopyWithImpl<$Res>
    extends _$WatchlistHistoryCopyWithImpl<$Res, _$WatchlistHistoryImpl>
    implements _$$WatchlistHistoryImplCopyWith<$Res> {
  __$$WatchlistHistoryImplCopyWithImpl(_$WatchlistHistoryImpl _value,
      $Res Function(_$WatchlistHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of WatchlistHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? watchListId = freezed,
    Object? symbol = null,
    Object? entryDate = null,
    Object? exitDate = null,
    Object? insiderAvgPrice = null,
    Object? exitPrice = null,
    Object? totalReturnPct = null,
    Object? daysWatched = null,
    Object? originalAnalysis = freezed,
    Object? exitReason = freezed,
    Object? secFilingUrls = freezed,
    Object? newsUrls = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$WatchlistHistoryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      watchListId: freezed == watchListId
          ? _value.watchListId
          : watchListId // ignore: cast_nullable_to_non_nullable
              as String?,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      entryDate: null == entryDate
          ? _value.entryDate
          : entryDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      exitDate: null == exitDate
          ? _value.exitDate
          : exitDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      insiderAvgPrice: null == insiderAvgPrice
          ? _value.insiderAvgPrice
          : insiderAvgPrice // ignore: cast_nullable_to_non_nullable
              as double,
      exitPrice: null == exitPrice
          ? _value.exitPrice
          : exitPrice // ignore: cast_nullable_to_non_nullable
              as double,
      totalReturnPct: null == totalReturnPct
          ? _value.totalReturnPct
          : totalReturnPct // ignore: cast_nullable_to_non_nullable
              as double,
      daysWatched: null == daysWatched
          ? _value.daysWatched
          : daysWatched // ignore: cast_nullable_to_non_nullable
              as int,
      originalAnalysis: freezed == originalAnalysis
          ? _value.originalAnalysis
          : originalAnalysis // ignore: cast_nullable_to_non_nullable
              as String?,
      exitReason: freezed == exitReason
          ? _value.exitReason
          : exitReason // ignore: cast_nullable_to_non_nullable
              as String?,
      secFilingUrls: freezed == secFilingUrls
          ? _value._secFilingUrls
          : secFilingUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      newsUrls: freezed == newsUrls
          ? _value._newsUrls
          : newsUrls // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchlistHistoryImpl implements _WatchlistHistory {
  const _$WatchlistHistoryImpl(
      {required this.id,
      this.watchListId,
      required this.symbol,
      required this.entryDate,
      required this.exitDate,
      required this.insiderAvgPrice,
      required this.exitPrice,
      required this.totalReturnPct,
      required this.daysWatched,
      this.originalAnalysis,
      this.exitReason,
      final List<String>? secFilingUrls,
      final List<String>? newsUrls,
      this.createdAt})
      : _secFilingUrls = secFilingUrls,
        _newsUrls = newsUrls;

  factory _$WatchlistHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchlistHistoryImplFromJson(json);

  @override
  final String id;
  @override
  final String? watchListId;
  @override
  final String symbol;
  @override
  final DateTime entryDate;
  @override
  final DateTime exitDate;
  @override
  final double insiderAvgPrice;
  @override
  final double exitPrice;
  @override
  final double totalReturnPct;
  @override
  final int daysWatched;
  @override
  final String? originalAnalysis;
  @override
  final String? exitReason;
  final List<String>? _secFilingUrls;
  @override
  List<String>? get secFilingUrls {
    final value = _secFilingUrls;
    if (value == null) return null;
    if (_secFilingUrls is EqualUnmodifiableListView) return _secFilingUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<String>? _newsUrls;
  @override
  List<String>? get newsUrls {
    final value = _newsUrls;
    if (value == null) return null;
    if (_newsUrls is EqualUnmodifiableListView) return _newsUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'WatchlistHistory(id: $id, watchListId: $watchListId, symbol: $symbol, entryDate: $entryDate, exitDate: $exitDate, insiderAvgPrice: $insiderAvgPrice, exitPrice: $exitPrice, totalReturnPct: $totalReturnPct, daysWatched: $daysWatched, originalAnalysis: $originalAnalysis, exitReason: $exitReason, secFilingUrls: $secFilingUrls, newsUrls: $newsUrls, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchlistHistoryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.watchListId, watchListId) ||
                other.watchListId == watchListId) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.entryDate, entryDate) ||
                other.entryDate == entryDate) &&
            (identical(other.exitDate, exitDate) ||
                other.exitDate == exitDate) &&
            (identical(other.insiderAvgPrice, insiderAvgPrice) ||
                other.insiderAvgPrice == insiderAvgPrice) &&
            (identical(other.exitPrice, exitPrice) ||
                other.exitPrice == exitPrice) &&
            (identical(other.totalReturnPct, totalReturnPct) ||
                other.totalReturnPct == totalReturnPct) &&
            (identical(other.daysWatched, daysWatched) ||
                other.daysWatched == daysWatched) &&
            (identical(other.originalAnalysis, originalAnalysis) ||
                other.originalAnalysis == originalAnalysis) &&
            (identical(other.exitReason, exitReason) ||
                other.exitReason == exitReason) &&
            const DeepCollectionEquality()
                .equals(other._secFilingUrls, _secFilingUrls) &&
            const DeepCollectionEquality().equals(other._newsUrls, _newsUrls) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      watchListId,
      symbol,
      entryDate,
      exitDate,
      insiderAvgPrice,
      exitPrice,
      totalReturnPct,
      daysWatched,
      originalAnalysis,
      exitReason,
      const DeepCollectionEquality().hash(_secFilingUrls),
      const DeepCollectionEquality().hash(_newsUrls),
      createdAt);

  /// Create a copy of WatchlistHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchlistHistoryImplCopyWith<_$WatchlistHistoryImpl> get copyWith =>
      __$$WatchlistHistoryImplCopyWithImpl<_$WatchlistHistoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchlistHistoryImplToJson(
      this,
    );
  }
}

abstract class _WatchlistHistory implements WatchlistHistory {
  const factory _WatchlistHistory(
      {required final String id,
      final String? watchListId,
      required final String symbol,
      required final DateTime entryDate,
      required final DateTime exitDate,
      required final double insiderAvgPrice,
      required final double exitPrice,
      required final double totalReturnPct,
      required final int daysWatched,
      final String? originalAnalysis,
      final String? exitReason,
      final List<String>? secFilingUrls,
      final List<String>? newsUrls,
      final DateTime? createdAt}) = _$WatchlistHistoryImpl;

  factory _WatchlistHistory.fromJson(Map<String, dynamic> json) =
      _$WatchlistHistoryImpl.fromJson;

  @override
  String get id;
  @override
  String? get watchListId;
  @override
  String get symbol;
  @override
  DateTime get entryDate;
  @override
  DateTime get exitDate;
  @override
  double get insiderAvgPrice;
  @override
  double get exitPrice;
  @override
  double get totalReturnPct;
  @override
  int get daysWatched;
  @override
  String? get originalAnalysis;
  @override
  String? get exitReason;
  @override
  List<String>? get secFilingUrls;
  @override
  List<String>? get newsUrls;
  @override
  DateTime? get createdAt;

  /// Create a copy of WatchlistHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WatchlistHistoryImplCopyWith<_$WatchlistHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InsiderTransaction _$InsiderTransactionFromJson(Map<String, dynamic> json) {
  return _InsiderTransaction.fromJson(json);
}

/// @nodoc
mixin _$InsiderTransaction {
  String get id => throw _privateConstructorUsedError; // uuid
  String get symbol => throw _privateConstructorUsedError; // varcgar
  DateTime get filingDate => throw _privateConstructorUsedError; // timestamptz
  DateTime get transactionDate => throw _privateConstructorUsedError; // date
  String get reportingName => throw _privateConstructorUsedError; // varchar
  String get reportingCik => throw _privateConstructorUsedError; // varchar
  String? get companyCik => throw _privateConstructorUsedError; // varchar
  String get transactionType => throw _privateConstructorUsedError; // varchar
  double? get securitiesTransacted =>
      throw _privateConstructorUsedError; // numeric
  double? get price => throw _privateConstructorUsedError; // numeric
  double? get totalValue => throw _privateConstructorUsedError; // numeric
  String? get typeOfOwner => throw _privateConstructorUsedError; // numeric
  String? get link => throw _privateConstructorUsedError; // text
  String? get securityName => throw _privateConstructorUsedError; // varchar
  String? get formType => throw _privateConstructorUsedError; // varchar
  double? get securitiesOwned => throw _privateConstructorUsedError; // numeric
  String? get acquisitionDisposition =>
      throw _privateConstructorUsedError; // varchar
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this InsiderTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of InsiderTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $InsiderTransactionCopyWith<InsiderTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InsiderTransactionCopyWith<$Res> {
  factory $InsiderTransactionCopyWith(
          InsiderTransaction value, $Res Function(InsiderTransaction) then) =
      _$InsiderTransactionCopyWithImpl<$Res, InsiderTransaction>;
  @useResult
  $Res call(
      {String id,
      String symbol,
      DateTime filingDate,
      DateTime transactionDate,
      String reportingName,
      String reportingCik,
      String? companyCik,
      String transactionType,
      double? securitiesTransacted,
      double? price,
      double? totalValue,
      String? typeOfOwner,
      String? link,
      String? securityName,
      String? formType,
      double? securitiesOwned,
      String? acquisitionDisposition,
      DateTime createdAt});
}

/// @nodoc
class _$InsiderTransactionCopyWithImpl<$Res, $Val extends InsiderTransaction>
    implements $InsiderTransactionCopyWith<$Res> {
  _$InsiderTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of InsiderTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? filingDate = null,
    Object? transactionDate = null,
    Object? reportingName = null,
    Object? reportingCik = null,
    Object? companyCik = freezed,
    Object? transactionType = null,
    Object? securitiesTransacted = freezed,
    Object? price = freezed,
    Object? totalValue = freezed,
    Object? typeOfOwner = freezed,
    Object? link = freezed,
    Object? securityName = freezed,
    Object? formType = freezed,
    Object? securitiesOwned = freezed,
    Object? acquisitionDisposition = freezed,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      filingDate: null == filingDate
          ? _value.filingDate
          : filingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reportingName: null == reportingName
          ? _value.reportingName
          : reportingName // ignore: cast_nullable_to_non_nullable
              as String,
      reportingCik: null == reportingCik
          ? _value.reportingCik
          : reportingCik // ignore: cast_nullable_to_non_nullable
              as String,
      companyCik: freezed == companyCik
          ? _value.companyCik
          : companyCik // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      securitiesTransacted: freezed == securitiesTransacted
          ? _value.securitiesTransacted
          : securitiesTransacted // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      totalValue: freezed == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double?,
      typeOfOwner: freezed == typeOfOwner
          ? _value.typeOfOwner
          : typeOfOwner // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      securityName: freezed == securityName
          ? _value.securityName
          : securityName // ignore: cast_nullable_to_non_nullable
              as String?,
      formType: freezed == formType
          ? _value.formType
          : formType // ignore: cast_nullable_to_non_nullable
              as String?,
      securitiesOwned: freezed == securitiesOwned
          ? _value.securitiesOwned
          : securitiesOwned // ignore: cast_nullable_to_non_nullable
              as double?,
      acquisitionDisposition: freezed == acquisitionDisposition
          ? _value.acquisitionDisposition
          : acquisitionDisposition // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InsiderTransactionImplCopyWith<$Res>
    implements $InsiderTransactionCopyWith<$Res> {
  factory _$$InsiderTransactionImplCopyWith(_$InsiderTransactionImpl value,
          $Res Function(_$InsiderTransactionImpl) then) =
      __$$InsiderTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String symbol,
      DateTime filingDate,
      DateTime transactionDate,
      String reportingName,
      String reportingCik,
      String? companyCik,
      String transactionType,
      double? securitiesTransacted,
      double? price,
      double? totalValue,
      String? typeOfOwner,
      String? link,
      String? securityName,
      String? formType,
      double? securitiesOwned,
      String? acquisitionDisposition,
      DateTime createdAt});
}

/// @nodoc
class __$$InsiderTransactionImplCopyWithImpl<$Res>
    extends _$InsiderTransactionCopyWithImpl<$Res, _$InsiderTransactionImpl>
    implements _$$InsiderTransactionImplCopyWith<$Res> {
  __$$InsiderTransactionImplCopyWithImpl(_$InsiderTransactionImpl _value,
      $Res Function(_$InsiderTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of InsiderTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? symbol = null,
    Object? filingDate = null,
    Object? transactionDate = null,
    Object? reportingName = null,
    Object? reportingCik = null,
    Object? companyCik = freezed,
    Object? transactionType = null,
    Object? securitiesTransacted = freezed,
    Object? price = freezed,
    Object? totalValue = freezed,
    Object? typeOfOwner = freezed,
    Object? link = freezed,
    Object? securityName = freezed,
    Object? formType = freezed,
    Object? securitiesOwned = freezed,
    Object? acquisitionDisposition = freezed,
    Object? createdAt = null,
  }) {
    return _then(_$InsiderTransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      filingDate: null == filingDate
          ? _value.filingDate
          : filingDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      transactionDate: null == transactionDate
          ? _value.transactionDate
          : transactionDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      reportingName: null == reportingName
          ? _value.reportingName
          : reportingName // ignore: cast_nullable_to_non_nullable
              as String,
      reportingCik: null == reportingCik
          ? _value.reportingCik
          : reportingCik // ignore: cast_nullable_to_non_nullable
              as String,
      companyCik: freezed == companyCik
          ? _value.companyCik
          : companyCik // ignore: cast_nullable_to_non_nullable
              as String?,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      securitiesTransacted: freezed == securitiesTransacted
          ? _value.securitiesTransacted
          : securitiesTransacted // ignore: cast_nullable_to_non_nullable
              as double?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double?,
      totalValue: freezed == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double?,
      typeOfOwner: freezed == typeOfOwner
          ? _value.typeOfOwner
          : typeOfOwner // ignore: cast_nullable_to_non_nullable
              as String?,
      link: freezed == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String?,
      securityName: freezed == securityName
          ? _value.securityName
          : securityName // ignore: cast_nullable_to_non_nullable
              as String?,
      formType: freezed == formType
          ? _value.formType
          : formType // ignore: cast_nullable_to_non_nullable
              as String?,
      securitiesOwned: freezed == securitiesOwned
          ? _value.securitiesOwned
          : securitiesOwned // ignore: cast_nullable_to_non_nullable
              as double?,
      acquisitionDisposition: freezed == acquisitionDisposition
          ? _value.acquisitionDisposition
          : acquisitionDisposition // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$InsiderTransactionImpl implements _InsiderTransaction {
  const _$InsiderTransactionImpl(
      {required this.id,
      required this.symbol,
      required this.filingDate,
      required this.transactionDate,
      required this.reportingName,
      required this.reportingCik,
      this.companyCik,
      required this.transactionType,
      this.securitiesTransacted,
      this.price,
      this.totalValue,
      this.typeOfOwner,
      this.link,
      this.securityName,
      this.formType,
      this.securitiesOwned,
      this.acquisitionDisposition,
      required this.createdAt});

  factory _$InsiderTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$InsiderTransactionImplFromJson(json);

  @override
  final String id;
// uuid
  @override
  final String symbol;
// varcgar
  @override
  final DateTime filingDate;
// timestamptz
  @override
  final DateTime transactionDate;
// date
  @override
  final String reportingName;
// varchar
  @override
  final String reportingCik;
// varchar
  @override
  final String? companyCik;
// varchar
  @override
  final String transactionType;
// varchar
  @override
  final double? securitiesTransacted;
// numeric
  @override
  final double? price;
// numeric
  @override
  final double? totalValue;
// numeric
  @override
  final String? typeOfOwner;
// numeric
  @override
  final String? link;
// text
  @override
  final String? securityName;
// varchar
  @override
  final String? formType;
// varchar
  @override
  final double? securitiesOwned;
// numeric
  @override
  final String? acquisitionDisposition;
// varchar
  @override
  final DateTime createdAt;

  @override
  String toString() {
    return 'InsiderTransaction(id: $id, symbol: $symbol, filingDate: $filingDate, transactionDate: $transactionDate, reportingName: $reportingName, reportingCik: $reportingCik, companyCik: $companyCik, transactionType: $transactionType, securitiesTransacted: $securitiesTransacted, price: $price, totalValue: $totalValue, typeOfOwner: $typeOfOwner, link: $link, securityName: $securityName, formType: $formType, securitiesOwned: $securitiesOwned, acquisitionDisposition: $acquisitionDisposition, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InsiderTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.filingDate, filingDate) ||
                other.filingDate == filingDate) &&
            (identical(other.transactionDate, transactionDate) ||
                other.transactionDate == transactionDate) &&
            (identical(other.reportingName, reportingName) ||
                other.reportingName == reportingName) &&
            (identical(other.reportingCik, reportingCik) ||
                other.reportingCik == reportingCik) &&
            (identical(other.companyCik, companyCik) ||
                other.companyCik == companyCik) &&
            (identical(other.transactionType, transactionType) ||
                other.transactionType == transactionType) &&
            (identical(other.securitiesTransacted, securitiesTransacted) ||
                other.securitiesTransacted == securitiesTransacted) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.typeOfOwner, typeOfOwner) ||
                other.typeOfOwner == typeOfOwner) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.securityName, securityName) ||
                other.securityName == securityName) &&
            (identical(other.formType, formType) ||
                other.formType == formType) &&
            (identical(other.securitiesOwned, securitiesOwned) ||
                other.securitiesOwned == securitiesOwned) &&
            (identical(other.acquisitionDisposition, acquisitionDisposition) ||
                other.acquisitionDisposition == acquisitionDisposition) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      symbol,
      filingDate,
      transactionDate,
      reportingName,
      reportingCik,
      companyCik,
      transactionType,
      securitiesTransacted,
      price,
      totalValue,
      typeOfOwner,
      link,
      securityName,
      formType,
      securitiesOwned,
      acquisitionDisposition,
      createdAt);

  /// Create a copy of InsiderTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InsiderTransactionImplCopyWith<_$InsiderTransactionImpl> get copyWith =>
      __$$InsiderTransactionImplCopyWithImpl<_$InsiderTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InsiderTransactionImplToJson(
      this,
    );
  }
}

abstract class _InsiderTransaction implements InsiderTransaction {
  const factory _InsiderTransaction(
      {required final String id,
      required final String symbol,
      required final DateTime filingDate,
      required final DateTime transactionDate,
      required final String reportingName,
      required final String reportingCik,
      final String? companyCik,
      required final String transactionType,
      final double? securitiesTransacted,
      final double? price,
      final double? totalValue,
      final String? typeOfOwner,
      final String? link,
      final String? securityName,
      final String? formType,
      final double? securitiesOwned,
      final String? acquisitionDisposition,
      required final DateTime createdAt}) = _$InsiderTransactionImpl;

  factory _InsiderTransaction.fromJson(Map<String, dynamic> json) =
      _$InsiderTransactionImpl.fromJson;

  @override
  String get id; // uuid
  @override
  String get symbol; // varcgar
  @override
  DateTime get filingDate; // timestamptz
  @override
  DateTime get transactionDate; // date
  @override
  String get reportingName; // varchar
  @override
  String get reportingCik; // varchar
  @override
  String? get companyCik; // varchar
  @override
  String get transactionType; // varchar
  @override
  double? get securitiesTransacted; // numeric
  @override
  double? get price; // numeric
  @override
  double? get totalValue; // numeric
  @override
  String? get typeOfOwner; // numeric
  @override
  String? get link; // text
  @override
  String? get securityName; // varchar
  @override
  String? get formType; // varchar
  @override
  double? get securitiesOwned; // numeric
  @override
  String? get acquisitionDisposition; // varchar
  @override
  DateTime get createdAt;

  /// Create a copy of InsiderTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InsiderTransactionImplCopyWith<_$InsiderTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
