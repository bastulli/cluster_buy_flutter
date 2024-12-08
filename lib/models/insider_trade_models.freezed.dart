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

ClusterAnalysis _$ClusterAnalysisFromJson(Map<String, dynamic> json) {
  return _ClusterAnalysis.fromJson(json);
}

/// @nodoc
mixin _$ClusterAnalysis {
  String get id => throw _privateConstructorUsedError;
  String get clusterDetectionId => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  DateTime get analysisDate => throw _privateConstructorUsedError;
  String get analysisType => throw _privateConstructorUsedError;
  String get analysisReasoning => throw _privateConstructorUsedError;
  int get confidenceScore => throw _privateConstructorUsedError;
  List<String> get keyFactors => throw _privateConstructorUsedError;
  List<String> get secFilingUrls => throw _privateConstructorUsedError;
  List<String> get newsUrls => throw _privateConstructorUsedError;
  double get priceAtAnalysis => throw _privateConstructorUsedError;
  double get insiderAvgPrice => throw _privateConstructorUsedError;
  bool get addedToWatchlist => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ClusterAnalysis to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ClusterAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ClusterAnalysisCopyWith<ClusterAnalysis> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ClusterAnalysisCopyWith<$Res> {
  factory $ClusterAnalysisCopyWith(
          ClusterAnalysis value, $Res Function(ClusterAnalysis) then) =
      _$ClusterAnalysisCopyWithImpl<$Res, ClusterAnalysis>;
  @useResult
  $Res call(
      {String id,
      String clusterDetectionId,
      String symbol,
      DateTime analysisDate,
      String analysisType,
      String analysisReasoning,
      int confidenceScore,
      List<String> keyFactors,
      List<String> secFilingUrls,
      List<String> newsUrls,
      double priceAtAnalysis,
      double insiderAvgPrice,
      bool addedToWatchlist,
      DateTime? createdAt});
}

/// @nodoc
class _$ClusterAnalysisCopyWithImpl<$Res, $Val extends ClusterAnalysis>
    implements $ClusterAnalysisCopyWith<$Res> {
  _$ClusterAnalysisCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ClusterAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clusterDetectionId = null,
    Object? symbol = null,
    Object? analysisDate = null,
    Object? analysisType = null,
    Object? analysisReasoning = null,
    Object? confidenceScore = null,
    Object? keyFactors = null,
    Object? secFilingUrls = null,
    Object? newsUrls = null,
    Object? priceAtAnalysis = null,
    Object? insiderAvgPrice = null,
    Object? addedToWatchlist = null,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      clusterDetectionId: null == clusterDetectionId
          ? _value.clusterDetectionId
          : clusterDetectionId // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      analysisDate: null == analysisDate
          ? _value.analysisDate
          : analysisDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      analysisType: null == analysisType
          ? _value.analysisType
          : analysisType // ignore: cast_nullable_to_non_nullable
              as String,
      analysisReasoning: null == analysisReasoning
          ? _value.analysisReasoning
          : analysisReasoning // ignore: cast_nullable_to_non_nullable
              as String,
      confidenceScore: null == confidenceScore
          ? _value.confidenceScore
          : confidenceScore // ignore: cast_nullable_to_non_nullable
              as int,
      keyFactors: null == keyFactors
          ? _value.keyFactors
          : keyFactors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      secFilingUrls: null == secFilingUrls
          ? _value.secFilingUrls
          : secFilingUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      newsUrls: null == newsUrls
          ? _value.newsUrls
          : newsUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      priceAtAnalysis: null == priceAtAnalysis
          ? _value.priceAtAnalysis
          : priceAtAnalysis // ignore: cast_nullable_to_non_nullable
              as double,
      insiderAvgPrice: null == insiderAvgPrice
          ? _value.insiderAvgPrice
          : insiderAvgPrice // ignore: cast_nullable_to_non_nullable
              as double,
      addedToWatchlist: null == addedToWatchlist
          ? _value.addedToWatchlist
          : addedToWatchlist // ignore: cast_nullable_to_non_nullable
              as bool,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ClusterAnalysisImplCopyWith<$Res>
    implements $ClusterAnalysisCopyWith<$Res> {
  factory _$$ClusterAnalysisImplCopyWith(_$ClusterAnalysisImpl value,
          $Res Function(_$ClusterAnalysisImpl) then) =
      __$$ClusterAnalysisImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String clusterDetectionId,
      String symbol,
      DateTime analysisDate,
      String analysisType,
      String analysisReasoning,
      int confidenceScore,
      List<String> keyFactors,
      List<String> secFilingUrls,
      List<String> newsUrls,
      double priceAtAnalysis,
      double insiderAvgPrice,
      bool addedToWatchlist,
      DateTime? createdAt});
}

/// @nodoc
class __$$ClusterAnalysisImplCopyWithImpl<$Res>
    extends _$ClusterAnalysisCopyWithImpl<$Res, _$ClusterAnalysisImpl>
    implements _$$ClusterAnalysisImplCopyWith<$Res> {
  __$$ClusterAnalysisImplCopyWithImpl(
      _$ClusterAnalysisImpl _value, $Res Function(_$ClusterAnalysisImpl) _then)
      : super(_value, _then);

  /// Create a copy of ClusterAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? clusterDetectionId = null,
    Object? symbol = null,
    Object? analysisDate = null,
    Object? analysisType = null,
    Object? analysisReasoning = null,
    Object? confidenceScore = null,
    Object? keyFactors = null,
    Object? secFilingUrls = null,
    Object? newsUrls = null,
    Object? priceAtAnalysis = null,
    Object? insiderAvgPrice = null,
    Object? addedToWatchlist = null,
    Object? createdAt = freezed,
  }) {
    return _then(_$ClusterAnalysisImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      clusterDetectionId: null == clusterDetectionId
          ? _value.clusterDetectionId
          : clusterDetectionId // ignore: cast_nullable_to_non_nullable
              as String,
      symbol: null == symbol
          ? _value.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
      analysisDate: null == analysisDate
          ? _value.analysisDate
          : analysisDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      analysisType: null == analysisType
          ? _value.analysisType
          : analysisType // ignore: cast_nullable_to_non_nullable
              as String,
      analysisReasoning: null == analysisReasoning
          ? _value.analysisReasoning
          : analysisReasoning // ignore: cast_nullable_to_non_nullable
              as String,
      confidenceScore: null == confidenceScore
          ? _value.confidenceScore
          : confidenceScore // ignore: cast_nullable_to_non_nullable
              as int,
      keyFactors: null == keyFactors
          ? _value._keyFactors
          : keyFactors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      secFilingUrls: null == secFilingUrls
          ? _value._secFilingUrls
          : secFilingUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      newsUrls: null == newsUrls
          ? _value._newsUrls
          : newsUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      priceAtAnalysis: null == priceAtAnalysis
          ? _value.priceAtAnalysis
          : priceAtAnalysis // ignore: cast_nullable_to_non_nullable
              as double,
      insiderAvgPrice: null == insiderAvgPrice
          ? _value.insiderAvgPrice
          : insiderAvgPrice // ignore: cast_nullable_to_non_nullable
              as double,
      addedToWatchlist: null == addedToWatchlist
          ? _value.addedToWatchlist
          : addedToWatchlist // ignore: cast_nullable_to_non_nullable
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
class _$ClusterAnalysisImpl implements _ClusterAnalysis {
  const _$ClusterAnalysisImpl(
      {required this.id,
      required this.clusterDetectionId,
      required this.symbol,
      required this.analysisDate,
      required this.analysisType,
      required this.analysisReasoning,
      required this.confidenceScore,
      required final List<String> keyFactors,
      required final List<String> secFilingUrls,
      required final List<String> newsUrls,
      required this.priceAtAnalysis,
      required this.insiderAvgPrice,
      this.addedToWatchlist = false,
      this.createdAt})
      : _keyFactors = keyFactors,
        _secFilingUrls = secFilingUrls,
        _newsUrls = newsUrls;

  factory _$ClusterAnalysisImpl.fromJson(Map<String, dynamic> json) =>
      _$$ClusterAnalysisImplFromJson(json);

  @override
  final String id;
  @override
  final String clusterDetectionId;
  @override
  final String symbol;
  @override
  final DateTime analysisDate;
  @override
  final String analysisType;
  @override
  final String analysisReasoning;
  @override
  final int confidenceScore;
  final List<String> _keyFactors;
  @override
  List<String> get keyFactors {
    if (_keyFactors is EqualUnmodifiableListView) return _keyFactors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyFactors);
  }

  final List<String> _secFilingUrls;
  @override
  List<String> get secFilingUrls {
    if (_secFilingUrls is EqualUnmodifiableListView) return _secFilingUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_secFilingUrls);
  }

  final List<String> _newsUrls;
  @override
  List<String> get newsUrls {
    if (_newsUrls is EqualUnmodifiableListView) return _newsUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newsUrls);
  }

  @override
  final double priceAtAnalysis;
  @override
  final double insiderAvgPrice;
  @override
  @JsonKey()
  final bool addedToWatchlist;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'ClusterAnalysis(id: $id, clusterDetectionId: $clusterDetectionId, symbol: $symbol, analysisDate: $analysisDate, analysisType: $analysisType, analysisReasoning: $analysisReasoning, confidenceScore: $confidenceScore, keyFactors: $keyFactors, secFilingUrls: $secFilingUrls, newsUrls: $newsUrls, priceAtAnalysis: $priceAtAnalysis, insiderAvgPrice: $insiderAvgPrice, addedToWatchlist: $addedToWatchlist, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ClusterAnalysisImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.clusterDetectionId, clusterDetectionId) ||
                other.clusterDetectionId == clusterDetectionId) &&
            (identical(other.symbol, symbol) || other.symbol == symbol) &&
            (identical(other.analysisDate, analysisDate) ||
                other.analysisDate == analysisDate) &&
            (identical(other.analysisType, analysisType) ||
                other.analysisType == analysisType) &&
            (identical(other.analysisReasoning, analysisReasoning) ||
                other.analysisReasoning == analysisReasoning) &&
            (identical(other.confidenceScore, confidenceScore) ||
                other.confidenceScore == confidenceScore) &&
            const DeepCollectionEquality()
                .equals(other._keyFactors, _keyFactors) &&
            const DeepCollectionEquality()
                .equals(other._secFilingUrls, _secFilingUrls) &&
            const DeepCollectionEquality().equals(other._newsUrls, _newsUrls) &&
            (identical(other.priceAtAnalysis, priceAtAnalysis) ||
                other.priceAtAnalysis == priceAtAnalysis) &&
            (identical(other.insiderAvgPrice, insiderAvgPrice) ||
                other.insiderAvgPrice == insiderAvgPrice) &&
            (identical(other.addedToWatchlist, addedToWatchlist) ||
                other.addedToWatchlist == addedToWatchlist) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      clusterDetectionId,
      symbol,
      analysisDate,
      analysisType,
      analysisReasoning,
      confidenceScore,
      const DeepCollectionEquality().hash(_keyFactors),
      const DeepCollectionEquality().hash(_secFilingUrls),
      const DeepCollectionEquality().hash(_newsUrls),
      priceAtAnalysis,
      insiderAvgPrice,
      addedToWatchlist,
      createdAt);

  /// Create a copy of ClusterAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ClusterAnalysisImplCopyWith<_$ClusterAnalysisImpl> get copyWith =>
      __$$ClusterAnalysisImplCopyWithImpl<_$ClusterAnalysisImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ClusterAnalysisImplToJson(
      this,
    );
  }
}

abstract class _ClusterAnalysis implements ClusterAnalysis {
  const factory _ClusterAnalysis(
      {required final String id,
      required final String clusterDetectionId,
      required final String symbol,
      required final DateTime analysisDate,
      required final String analysisType,
      required final String analysisReasoning,
      required final int confidenceScore,
      required final List<String> keyFactors,
      required final List<String> secFilingUrls,
      required final List<String> newsUrls,
      required final double priceAtAnalysis,
      required final double insiderAvgPrice,
      final bool addedToWatchlist,
      final DateTime? createdAt}) = _$ClusterAnalysisImpl;

  factory _ClusterAnalysis.fromJson(Map<String, dynamic> json) =
      _$ClusterAnalysisImpl.fromJson;

  @override
  String get id;
  @override
  String get clusterDetectionId;
  @override
  String get symbol;
  @override
  DateTime get analysisDate;
  @override
  String get analysisType;
  @override
  String get analysisReasoning;
  @override
  int get confidenceScore;
  @override
  List<String> get keyFactors;
  @override
  List<String> get secFilingUrls;
  @override
  List<String> get newsUrls;
  @override
  double get priceAtAnalysis;
  @override
  double get insiderAvgPrice;
  @override
  bool get addedToWatchlist;
  @override
  DateTime? get createdAt;

  /// Create a copy of ClusterAnalysis
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ClusterAnalysisImplCopyWith<_$ClusterAnalysisImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InsiderTransaction _$InsiderTransactionFromJson(Map<String, dynamic> json) {
  return _InsiderTransaction.fromJson(json);
}

/// @nodoc
mixin _$InsiderTransaction {
  int get id =>
      throw _privateConstructorUsedError; // Changed from String to int
  String get symbol => throw _privateConstructorUsedError;
  DateTime get filingDate => throw _privateConstructorUsedError;
  DateTime get transactionDate => throw _privateConstructorUsedError;
  String get reportingName => throw _privateConstructorUsedError;
  String get reportingCik => throw _privateConstructorUsedError;
  String get companyCik => throw _privateConstructorUsedError;
  String get transactionType => throw _privateConstructorUsedError;
  double get securitiesTransacted => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;
  double get totalValue => throw _privateConstructorUsedError;
  String get typeOfOwner => throw _privateConstructorUsedError;
  String? get link => throw _privateConstructorUsedError;
  String? get securityName => throw _privateConstructorUsedError;
  String? get formType => throw _privateConstructorUsedError;
  double? get securitiesOwned => throw _privateConstructorUsedError;
  String? get acquisitionDisposition => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

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
      {int id,
      String symbol,
      DateTime filingDate,
      DateTime transactionDate,
      String reportingName,
      String reportingCik,
      String companyCik,
      String transactionType,
      double securitiesTransacted,
      double price,
      double totalValue,
      String typeOfOwner,
      String? link,
      String? securityName,
      String? formType,
      double? securitiesOwned,
      String? acquisitionDisposition,
      DateTime? createdAt});
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
    Object? companyCik = null,
    Object? transactionType = null,
    Object? securitiesTransacted = null,
    Object? price = null,
    Object? totalValue = null,
    Object? typeOfOwner = null,
    Object? link = freezed,
    Object? securityName = freezed,
    Object? formType = freezed,
    Object? securitiesOwned = freezed,
    Object? acquisitionDisposition = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      companyCik: null == companyCik
          ? _value.companyCik
          : companyCik // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      securitiesTransacted: null == securitiesTransacted
          ? _value.securitiesTransacted
          : securitiesTransacted // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      typeOfOwner: null == typeOfOwner
          ? _value.typeOfOwner
          : typeOfOwner // ignore: cast_nullable_to_non_nullable
              as String,
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      {int id,
      String symbol,
      DateTime filingDate,
      DateTime transactionDate,
      String reportingName,
      String reportingCik,
      String companyCik,
      String transactionType,
      double securitiesTransacted,
      double price,
      double totalValue,
      String typeOfOwner,
      String? link,
      String? securityName,
      String? formType,
      double? securitiesOwned,
      String? acquisitionDisposition,
      DateTime? createdAt});
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
    Object? companyCik = null,
    Object? transactionType = null,
    Object? securitiesTransacted = null,
    Object? price = null,
    Object? totalValue = null,
    Object? typeOfOwner = null,
    Object? link = freezed,
    Object? securityName = freezed,
    Object? formType = freezed,
    Object? securitiesOwned = freezed,
    Object? acquisitionDisposition = freezed,
    Object? createdAt = freezed,
  }) {
    return _then(_$InsiderTransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
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
      companyCik: null == companyCik
          ? _value.companyCik
          : companyCik // ignore: cast_nullable_to_non_nullable
              as String,
      transactionType: null == transactionType
          ? _value.transactionType
          : transactionType // ignore: cast_nullable_to_non_nullable
              as String,
      securitiesTransacted: null == securitiesTransacted
          ? _value.securitiesTransacted
          : securitiesTransacted // ignore: cast_nullable_to_non_nullable
              as double,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      typeOfOwner: null == typeOfOwner
          ? _value.typeOfOwner
          : typeOfOwner // ignore: cast_nullable_to_non_nullable
              as String,
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
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      required this.companyCik,
      required this.transactionType,
      required this.securitiesTransacted,
      required this.price,
      required this.totalValue,
      required this.typeOfOwner,
      this.link,
      this.securityName,
      this.formType,
      this.securitiesOwned,
      this.acquisitionDisposition,
      this.createdAt});

  factory _$InsiderTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$InsiderTransactionImplFromJson(json);

  @override
  final int id;
// Changed from String to int
  @override
  final String symbol;
  @override
  final DateTime filingDate;
  @override
  final DateTime transactionDate;
  @override
  final String reportingName;
  @override
  final String reportingCik;
  @override
  final String companyCik;
  @override
  final String transactionType;
  @override
  final double securitiesTransacted;
  @override
  final double price;
  @override
  final double totalValue;
  @override
  final String typeOfOwner;
  @override
  final String? link;
  @override
  final String? securityName;
  @override
  final String? formType;
  @override
  final double? securitiesOwned;
  @override
  final String? acquisitionDisposition;
  @override
  final DateTime? createdAt;

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
      {required final int id,
      required final String symbol,
      required final DateTime filingDate,
      required final DateTime transactionDate,
      required final String reportingName,
      required final String reportingCik,
      required final String companyCik,
      required final String transactionType,
      required final double securitiesTransacted,
      required final double price,
      required final double totalValue,
      required final String typeOfOwner,
      final String? link,
      final String? securityName,
      final String? formType,
      final double? securitiesOwned,
      final String? acquisitionDisposition,
      final DateTime? createdAt}) = _$InsiderTransactionImpl;

  factory _InsiderTransaction.fromJson(Map<String, dynamic> json) =
      _$InsiderTransactionImpl.fromJson;

  @override
  int get id; // Changed from String to int
  @override
  String get symbol;
  @override
  DateTime get filingDate;
  @override
  DateTime get transactionDate;
  @override
  String get reportingName;
  @override
  String get reportingCik;
  @override
  String get companyCik;
  @override
  String get transactionType;
  @override
  double get securitiesTransacted;
  @override
  double get price;
  @override
  double get totalValue;
  @override
  String get typeOfOwner;
  @override
  String? get link;
  @override
  String? get securityName;
  @override
  String? get formType;
  @override
  double? get securitiesOwned;
  @override
  String? get acquisitionDisposition;
  @override
  DateTime? get createdAt;

  /// Create a copy of InsiderTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InsiderTransactionImplCopyWith<_$InsiderTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

TradeStats _$TradeStatsFromJson(Map<String, dynamic> json) {
  return _TradeStats.fromJson(json);
}

/// @nodoc
mixin _$TradeStats {
  String get id => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  int get totalTrades => throw _privateConstructorUsedError;
  int get buyCount => throw _privateConstructorUsedError;
  int get sellCount => throw _privateConstructorUsedError;
  double get totalBuyValue => throw _privateConstructorUsedError;
  double get totalSellValue => throw _privateConstructorUsedError;
  int get uniqueSymbols => throw _privateConstructorUsedError;
  String get period => throw _privateConstructorUsedError;
  DateTime? get createdAt => throw _privateConstructorUsedError;

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
      int totalTrades,
      int buyCount,
      int sellCount,
      double totalBuyValue,
      double totalSellValue,
      int uniqueSymbols,
      String period,
      DateTime? createdAt});
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
    Object? totalTrades = null,
    Object? buyCount = null,
    Object? sellCount = null,
    Object? totalBuyValue = null,
    Object? totalSellValue = null,
    Object? uniqueSymbols = null,
    Object? period = null,
    Object? createdAt = freezed,
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
      uniqueSymbols: null == uniqueSymbols
          ? _value.uniqueSymbols
          : uniqueSymbols // ignore: cast_nullable_to_non_nullable
              as int,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
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
      int totalTrades,
      int buyCount,
      int sellCount,
      double totalBuyValue,
      double totalSellValue,
      int uniqueSymbols,
      String period,
      DateTime? createdAt});
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
    Object? totalTrades = null,
    Object? buyCount = null,
    Object? sellCount = null,
    Object? totalBuyValue = null,
    Object? totalSellValue = null,
    Object? uniqueSymbols = null,
    Object? period = null,
    Object? createdAt = freezed,
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
      uniqueSymbols: null == uniqueSymbols
          ? _value.uniqueSymbols
          : uniqueSymbols // ignore: cast_nullable_to_non_nullable
              as int,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TradeStatsImpl implements _TradeStats {
  const _$TradeStatsImpl(
      {required this.id,
      required this.date,
      required this.totalTrades,
      required this.buyCount,
      required this.sellCount,
      required this.totalBuyValue,
      required this.totalSellValue,
      required this.uniqueSymbols,
      required this.period,
      this.createdAt});

  factory _$TradeStatsImpl.fromJson(Map<String, dynamic> json) =>
      _$$TradeStatsImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime date;
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
  final int uniqueSymbols;
  @override
  final String period;
  @override
  final DateTime? createdAt;

  @override
  String toString() {
    return 'TradeStats(id: $id, date: $date, totalTrades: $totalTrades, buyCount: $buyCount, sellCount: $sellCount, totalBuyValue: $totalBuyValue, totalSellValue: $totalSellValue, uniqueSymbols: $uniqueSymbols, period: $period, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TradeStatsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.date, date) || other.date == date) &&
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
            (identical(other.uniqueSymbols, uniqueSymbols) ||
                other.uniqueSymbols == uniqueSymbols) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      date,
      totalTrades,
      buyCount,
      sellCount,
      totalBuyValue,
      totalSellValue,
      uniqueSymbols,
      period,
      createdAt);

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
      required final int totalTrades,
      required final int buyCount,
      required final int sellCount,
      required final double totalBuyValue,
      required final double totalSellValue,
      required final int uniqueSymbols,
      required final String period,
      final DateTime? createdAt}) = _$TradeStatsImpl;

  factory _TradeStats.fromJson(Map<String, dynamic> json) =
      _$TradeStatsImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get date;
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
  int get uniqueSymbols;
  @override
  String get period;
  @override
  DateTime? get createdAt;

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
  String get id => throw _privateConstructorUsedError;
  String get symbol => throw _privateConstructorUsedError;
  String get clusterAnalysisId => throw _privateConstructorUsedError;
  DateTime get entryDate => throw _privateConstructorUsedError;
  double get insiderAvgPrice => throw _privateConstructorUsedError;
  double get currentPrice => throw _privateConstructorUsedError;
  double get priceChangePct => throw _privateConstructorUsedError;
  int get daysWatched => throw _privateConstructorUsedError;
  String get analysisReasoning => throw _privateConstructorUsedError;
  List<String> get keyFactors => throw _privateConstructorUsedError;
  List<String> get secFilingUrls => throw _privateConstructorUsedError;
  List<String> get newsUrls => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  DateTime get lastUpdated => throw _privateConstructorUsedError;
  List<PricePoint> get priceHistory => throw _privateConstructorUsedError;

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
      String clusterAnalysisId,
      DateTime entryDate,
      double insiderAvgPrice,
      double currentPrice,
      double priceChangePct,
      int daysWatched,
      String analysisReasoning,
      List<String> keyFactors,
      List<String> secFilingUrls,
      List<String> newsUrls,
      String status,
      DateTime lastUpdated,
      List<PricePoint> priceHistory});
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
    Object? clusterAnalysisId = null,
    Object? entryDate = null,
    Object? insiderAvgPrice = null,
    Object? currentPrice = null,
    Object? priceChangePct = null,
    Object? daysWatched = null,
    Object? analysisReasoning = null,
    Object? keyFactors = null,
    Object? secFilingUrls = null,
    Object? newsUrls = null,
    Object? status = null,
    Object? lastUpdated = null,
    Object? priceHistory = null,
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
      clusterAnalysisId: null == clusterAnalysisId
          ? _value.clusterAnalysisId
          : clusterAnalysisId // ignore: cast_nullable_to_non_nullable
              as String,
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
      analysisReasoning: null == analysisReasoning
          ? _value.analysisReasoning
          : analysisReasoning // ignore: cast_nullable_to_non_nullable
              as String,
      keyFactors: null == keyFactors
          ? _value.keyFactors
          : keyFactors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      secFilingUrls: null == secFilingUrls
          ? _value.secFilingUrls
          : secFilingUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      newsUrls: null == newsUrls
          ? _value.newsUrls
          : newsUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      priceHistory: null == priceHistory
          ? _value.priceHistory
          : priceHistory // ignore: cast_nullable_to_non_nullable
              as List<PricePoint>,
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
      String clusterAnalysisId,
      DateTime entryDate,
      double insiderAvgPrice,
      double currentPrice,
      double priceChangePct,
      int daysWatched,
      String analysisReasoning,
      List<String> keyFactors,
      List<String> secFilingUrls,
      List<String> newsUrls,
      String status,
      DateTime lastUpdated,
      List<PricePoint> priceHistory});
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
    Object? clusterAnalysisId = null,
    Object? entryDate = null,
    Object? insiderAvgPrice = null,
    Object? currentPrice = null,
    Object? priceChangePct = null,
    Object? daysWatched = null,
    Object? analysisReasoning = null,
    Object? keyFactors = null,
    Object? secFilingUrls = null,
    Object? newsUrls = null,
    Object? status = null,
    Object? lastUpdated = null,
    Object? priceHistory = null,
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
      clusterAnalysisId: null == clusterAnalysisId
          ? _value.clusterAnalysisId
          : clusterAnalysisId // ignore: cast_nullable_to_non_nullable
              as String,
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
      analysisReasoning: null == analysisReasoning
          ? _value.analysisReasoning
          : analysisReasoning // ignore: cast_nullable_to_non_nullable
              as String,
      keyFactors: null == keyFactors
          ? _value._keyFactors
          : keyFactors // ignore: cast_nullable_to_non_nullable
              as List<String>,
      secFilingUrls: null == secFilingUrls
          ? _value._secFilingUrls
          : secFilingUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      newsUrls: null == newsUrls
          ? _value._newsUrls
          : newsUrls // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      lastUpdated: null == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime,
      priceHistory: null == priceHistory
          ? _value._priceHistory
          : priceHistory // ignore: cast_nullable_to_non_nullable
              as List<PricePoint>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchlistStockImpl implements _WatchlistStock {
  const _$WatchlistStockImpl(
      {required this.id,
      required this.symbol,
      required this.clusterAnalysisId,
      required this.entryDate,
      required this.insiderAvgPrice,
      required this.currentPrice,
      required this.priceChangePct,
      required this.daysWatched,
      required this.analysisReasoning,
      required final List<String> keyFactors,
      required final List<String> secFilingUrls,
      required final List<String> newsUrls,
      required this.status,
      required this.lastUpdated,
      required final List<PricePoint> priceHistory})
      : _keyFactors = keyFactors,
        _secFilingUrls = secFilingUrls,
        _newsUrls = newsUrls,
        _priceHistory = priceHistory;

  factory _$WatchlistStockImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchlistStockImplFromJson(json);

  @override
  final String id;
  @override
  final String symbol;
  @override
  final String clusterAnalysisId;
  @override
  final DateTime entryDate;
  @override
  final double insiderAvgPrice;
  @override
  final double currentPrice;
  @override
  final double priceChangePct;
  @override
  final int daysWatched;
  @override
  final String analysisReasoning;
  final List<String> _keyFactors;
  @override
  List<String> get keyFactors {
    if (_keyFactors is EqualUnmodifiableListView) return _keyFactors;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_keyFactors);
  }

  final List<String> _secFilingUrls;
  @override
  List<String> get secFilingUrls {
    if (_secFilingUrls is EqualUnmodifiableListView) return _secFilingUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_secFilingUrls);
  }

  final List<String> _newsUrls;
  @override
  List<String> get newsUrls {
    if (_newsUrls is EqualUnmodifiableListView) return _newsUrls;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_newsUrls);
  }

  @override
  final String status;
  @override
  final DateTime lastUpdated;
  final List<PricePoint> _priceHistory;
  @override
  List<PricePoint> get priceHistory {
    if (_priceHistory is EqualUnmodifiableListView) return _priceHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_priceHistory);
  }

  @override
  String toString() {
    return 'WatchlistStock(id: $id, symbol: $symbol, clusterAnalysisId: $clusterAnalysisId, entryDate: $entryDate, insiderAvgPrice: $insiderAvgPrice, currentPrice: $currentPrice, priceChangePct: $priceChangePct, daysWatched: $daysWatched, analysisReasoning: $analysisReasoning, keyFactors: $keyFactors, secFilingUrls: $secFilingUrls, newsUrls: $newsUrls, status: $status, lastUpdated: $lastUpdated, priceHistory: $priceHistory)';
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
            const DeepCollectionEquality()
                .equals(other._priceHistory, _priceHistory));
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
      const DeepCollectionEquality().hash(_priceHistory));

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

abstract class _WatchlistStock implements WatchlistStock {
  const factory _WatchlistStock(
      {required final String id,
      required final String symbol,
      required final String clusterAnalysisId,
      required final DateTime entryDate,
      required final double insiderAvgPrice,
      required final double currentPrice,
      required final double priceChangePct,
      required final int daysWatched,
      required final String analysisReasoning,
      required final List<String> keyFactors,
      required final List<String> secFilingUrls,
      required final List<String> newsUrls,
      required final String status,
      required final DateTime lastUpdated,
      required final List<PricePoint> priceHistory}) = _$WatchlistStockImpl;

  factory _WatchlistStock.fromJson(Map<String, dynamic> json) =
      _$WatchlistStockImpl.fromJson;

  @override
  String get id;
  @override
  String get symbol;
  @override
  String get clusterAnalysisId;
  @override
  DateTime get entryDate;
  @override
  double get insiderAvgPrice;
  @override
  double get currentPrice;
  @override
  double get priceChangePct;
  @override
  int get daysWatched;
  @override
  String get analysisReasoning;
  @override
  List<String> get keyFactors;
  @override
  List<String> get secFilingUrls;
  @override
  List<String> get newsUrls;
  @override
  String get status;
  @override
  DateTime get lastUpdated;
  @override
  List<PricePoint> get priceHistory;

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
  String get date => throw _privateConstructorUsedError;
  double get price => throw _privateConstructorUsedError;

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
  $Res call({String date, double price});
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
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
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
  $Res call({String date, double price});
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
  }) {
    return _then(_$PricePointImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PricePointImpl implements _PricePoint {
  const _$PricePointImpl({required this.date, required this.price});

  factory _$PricePointImpl.fromJson(Map<String, dynamic> json) =>
      _$$PricePointImplFromJson(json);

  @override
  final String date;
  @override
  final double price;

  @override
  String toString() {
    return 'PricePoint(date: $date, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PricePointImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.price, price) || other.price == price));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, price);

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
      {required final String date,
      required final double price}) = _$PricePointImpl;

  factory _PricePoint.fromJson(Map<String, dynamic> json) =
      _$PricePointImpl.fromJson;

  @override
  String get date;
  @override
  double get price;

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
  String get watchListId => throw _privateConstructorUsedError;
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
      String watchListId,
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
    Object? watchListId = null,
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
      watchListId: null == watchListId
          ? _value.watchListId
          : watchListId // ignore: cast_nullable_to_non_nullable
              as String,
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
      String watchListId,
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
    Object? watchListId = null,
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
      watchListId: null == watchListId
          ? _value.watchListId
          : watchListId // ignore: cast_nullable_to_non_nullable
              as String,
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
      required this.watchListId,
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
  final String watchListId;
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
      required final String watchListId,
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
  String get watchListId;
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

WatchlistSummary _$WatchlistSummaryFromJson(Map<String, dynamic> json) {
  return _WatchlistSummary.fromJson(json);
}

/// @nodoc
mixin _$WatchlistSummary {
  int get totalStocks => throw _privateConstructorUsedError;
  int get activeSignals => throw _privateConstructorUsedError;
  double get averageReturn => throw _privateConstructorUsedError;
  int get profitablePositions => throw _privateConstructorUsedError;
  double get bestPerformer => throw _privateConstructorUsedError;
  String get bestSymbol => throw _privateConstructorUsedError;
  double get totalValue => throw _privateConstructorUsedError;
  double get realizedGain => throw _privateConstructorUsedError;
  double get unrealizedGain => throw _privateConstructorUsedError;
  Map<String, double> get sectorAllocation =>
      throw _privateConstructorUsedError;
  int get totalTransactions => throw _privateConstructorUsedError;
  double get averageTransactionSize => throw _privateConstructorUsedError;
  DateTime? get lastUpdated => throw _privateConstructorUsedError;
  List<String> get topPerformers => throw _privateConstructorUsedError;
  List<String> get recentlyAdded => throw _privateConstructorUsedError;

  /// Serializes this WatchlistSummary to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WatchlistSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WatchlistSummaryCopyWith<WatchlistSummary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WatchlistSummaryCopyWith<$Res> {
  factory $WatchlistSummaryCopyWith(
          WatchlistSummary value, $Res Function(WatchlistSummary) then) =
      _$WatchlistSummaryCopyWithImpl<$Res, WatchlistSummary>;
  @useResult
  $Res call(
      {int totalStocks,
      int activeSignals,
      double averageReturn,
      int profitablePositions,
      double bestPerformer,
      String bestSymbol,
      double totalValue,
      double realizedGain,
      double unrealizedGain,
      Map<String, double> sectorAllocation,
      int totalTransactions,
      double averageTransactionSize,
      DateTime? lastUpdated,
      List<String> topPerformers,
      List<String> recentlyAdded});
}

/// @nodoc
class _$WatchlistSummaryCopyWithImpl<$Res, $Val extends WatchlistSummary>
    implements $WatchlistSummaryCopyWith<$Res> {
  _$WatchlistSummaryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WatchlistSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalStocks = null,
    Object? activeSignals = null,
    Object? averageReturn = null,
    Object? profitablePositions = null,
    Object? bestPerformer = null,
    Object? bestSymbol = null,
    Object? totalValue = null,
    Object? realizedGain = null,
    Object? unrealizedGain = null,
    Object? sectorAllocation = null,
    Object? totalTransactions = null,
    Object? averageTransactionSize = null,
    Object? lastUpdated = freezed,
    Object? topPerformers = null,
    Object? recentlyAdded = null,
  }) {
    return _then(_value.copyWith(
      totalStocks: null == totalStocks
          ? _value.totalStocks
          : totalStocks // ignore: cast_nullable_to_non_nullable
              as int,
      activeSignals: null == activeSignals
          ? _value.activeSignals
          : activeSignals // ignore: cast_nullable_to_non_nullable
              as int,
      averageReturn: null == averageReturn
          ? _value.averageReturn
          : averageReturn // ignore: cast_nullable_to_non_nullable
              as double,
      profitablePositions: null == profitablePositions
          ? _value.profitablePositions
          : profitablePositions // ignore: cast_nullable_to_non_nullable
              as int,
      bestPerformer: null == bestPerformer
          ? _value.bestPerformer
          : bestPerformer // ignore: cast_nullable_to_non_nullable
              as double,
      bestSymbol: null == bestSymbol
          ? _value.bestSymbol
          : bestSymbol // ignore: cast_nullable_to_non_nullable
              as String,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      realizedGain: null == realizedGain
          ? _value.realizedGain
          : realizedGain // ignore: cast_nullable_to_non_nullable
              as double,
      unrealizedGain: null == unrealizedGain
          ? _value.unrealizedGain
          : unrealizedGain // ignore: cast_nullable_to_non_nullable
              as double,
      sectorAllocation: null == sectorAllocation
          ? _value.sectorAllocation
          : sectorAllocation // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      totalTransactions: null == totalTransactions
          ? _value.totalTransactions
          : totalTransactions // ignore: cast_nullable_to_non_nullable
              as int,
      averageTransactionSize: null == averageTransactionSize
          ? _value.averageTransactionSize
          : averageTransactionSize // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      topPerformers: null == topPerformers
          ? _value.topPerformers
          : topPerformers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recentlyAdded: null == recentlyAdded
          ? _value.recentlyAdded
          : recentlyAdded // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WatchlistSummaryImplCopyWith<$Res>
    implements $WatchlistSummaryCopyWith<$Res> {
  factory _$$WatchlistSummaryImplCopyWith(_$WatchlistSummaryImpl value,
          $Res Function(_$WatchlistSummaryImpl) then) =
      __$$WatchlistSummaryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int totalStocks,
      int activeSignals,
      double averageReturn,
      int profitablePositions,
      double bestPerformer,
      String bestSymbol,
      double totalValue,
      double realizedGain,
      double unrealizedGain,
      Map<String, double> sectorAllocation,
      int totalTransactions,
      double averageTransactionSize,
      DateTime? lastUpdated,
      List<String> topPerformers,
      List<String> recentlyAdded});
}

/// @nodoc
class __$$WatchlistSummaryImplCopyWithImpl<$Res>
    extends _$WatchlistSummaryCopyWithImpl<$Res, _$WatchlistSummaryImpl>
    implements _$$WatchlistSummaryImplCopyWith<$Res> {
  __$$WatchlistSummaryImplCopyWithImpl(_$WatchlistSummaryImpl _value,
      $Res Function(_$WatchlistSummaryImpl) _then)
      : super(_value, _then);

  /// Create a copy of WatchlistSummary
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalStocks = null,
    Object? activeSignals = null,
    Object? averageReturn = null,
    Object? profitablePositions = null,
    Object? bestPerformer = null,
    Object? bestSymbol = null,
    Object? totalValue = null,
    Object? realizedGain = null,
    Object? unrealizedGain = null,
    Object? sectorAllocation = null,
    Object? totalTransactions = null,
    Object? averageTransactionSize = null,
    Object? lastUpdated = freezed,
    Object? topPerformers = null,
    Object? recentlyAdded = null,
  }) {
    return _then(_$WatchlistSummaryImpl(
      totalStocks: null == totalStocks
          ? _value.totalStocks
          : totalStocks // ignore: cast_nullable_to_non_nullable
              as int,
      activeSignals: null == activeSignals
          ? _value.activeSignals
          : activeSignals // ignore: cast_nullable_to_non_nullable
              as int,
      averageReturn: null == averageReturn
          ? _value.averageReturn
          : averageReturn // ignore: cast_nullable_to_non_nullable
              as double,
      profitablePositions: null == profitablePositions
          ? _value.profitablePositions
          : profitablePositions // ignore: cast_nullable_to_non_nullable
              as int,
      bestPerformer: null == bestPerformer
          ? _value.bestPerformer
          : bestPerformer // ignore: cast_nullable_to_non_nullable
              as double,
      bestSymbol: null == bestSymbol
          ? _value.bestSymbol
          : bestSymbol // ignore: cast_nullable_to_non_nullable
              as String,
      totalValue: null == totalValue
          ? _value.totalValue
          : totalValue // ignore: cast_nullable_to_non_nullable
              as double,
      realizedGain: null == realizedGain
          ? _value.realizedGain
          : realizedGain // ignore: cast_nullable_to_non_nullable
              as double,
      unrealizedGain: null == unrealizedGain
          ? _value.unrealizedGain
          : unrealizedGain // ignore: cast_nullable_to_non_nullable
              as double,
      sectorAllocation: null == sectorAllocation
          ? _value._sectorAllocation
          : sectorAllocation // ignore: cast_nullable_to_non_nullable
              as Map<String, double>,
      totalTransactions: null == totalTransactions
          ? _value.totalTransactions
          : totalTransactions // ignore: cast_nullable_to_non_nullable
              as int,
      averageTransactionSize: null == averageTransactionSize
          ? _value.averageTransactionSize
          : averageTransactionSize // ignore: cast_nullable_to_non_nullable
              as double,
      lastUpdated: freezed == lastUpdated
          ? _value.lastUpdated
          : lastUpdated // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      topPerformers: null == topPerformers
          ? _value._topPerformers
          : topPerformers // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recentlyAdded: null == recentlyAdded
          ? _value._recentlyAdded
          : recentlyAdded // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WatchlistSummaryImpl implements _WatchlistSummary {
  const _$WatchlistSummaryImpl(
      {required this.totalStocks,
      required this.activeSignals,
      required this.averageReturn,
      required this.profitablePositions,
      required this.bestPerformer,
      required this.bestSymbol,
      required this.totalValue,
      this.realizedGain = 0.0,
      this.unrealizedGain = 0.0,
      final Map<String, double> sectorAllocation = const {},
      this.totalTransactions = 0,
      this.averageTransactionSize = 0.0,
      this.lastUpdated,
      final List<String> topPerformers = const [],
      final List<String> recentlyAdded = const []})
      : _sectorAllocation = sectorAllocation,
        _topPerformers = topPerformers,
        _recentlyAdded = recentlyAdded;

  factory _$WatchlistSummaryImpl.fromJson(Map<String, dynamic> json) =>
      _$$WatchlistSummaryImplFromJson(json);

  @override
  final int totalStocks;
  @override
  final int activeSignals;
  @override
  final double averageReturn;
  @override
  final int profitablePositions;
  @override
  final double bestPerformer;
  @override
  final String bestSymbol;
  @override
  final double totalValue;
  @override
  @JsonKey()
  final double realizedGain;
  @override
  @JsonKey()
  final double unrealizedGain;
  final Map<String, double> _sectorAllocation;
  @override
  @JsonKey()
  Map<String, double> get sectorAllocation {
    if (_sectorAllocation is EqualUnmodifiableMapView) return _sectorAllocation;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_sectorAllocation);
  }

  @override
  @JsonKey()
  final int totalTransactions;
  @override
  @JsonKey()
  final double averageTransactionSize;
  @override
  final DateTime? lastUpdated;
  final List<String> _topPerformers;
  @override
  @JsonKey()
  List<String> get topPerformers {
    if (_topPerformers is EqualUnmodifiableListView) return _topPerformers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_topPerformers);
  }

  final List<String> _recentlyAdded;
  @override
  @JsonKey()
  List<String> get recentlyAdded {
    if (_recentlyAdded is EqualUnmodifiableListView) return _recentlyAdded;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentlyAdded);
  }

  @override
  String toString() {
    return 'WatchlistSummary(totalStocks: $totalStocks, activeSignals: $activeSignals, averageReturn: $averageReturn, profitablePositions: $profitablePositions, bestPerformer: $bestPerformer, bestSymbol: $bestSymbol, totalValue: $totalValue, realizedGain: $realizedGain, unrealizedGain: $unrealizedGain, sectorAllocation: $sectorAllocation, totalTransactions: $totalTransactions, averageTransactionSize: $averageTransactionSize, lastUpdated: $lastUpdated, topPerformers: $topPerformers, recentlyAdded: $recentlyAdded)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WatchlistSummaryImpl &&
            (identical(other.totalStocks, totalStocks) ||
                other.totalStocks == totalStocks) &&
            (identical(other.activeSignals, activeSignals) ||
                other.activeSignals == activeSignals) &&
            (identical(other.averageReturn, averageReturn) ||
                other.averageReturn == averageReturn) &&
            (identical(other.profitablePositions, profitablePositions) ||
                other.profitablePositions == profitablePositions) &&
            (identical(other.bestPerformer, bestPerformer) ||
                other.bestPerformer == bestPerformer) &&
            (identical(other.bestSymbol, bestSymbol) ||
                other.bestSymbol == bestSymbol) &&
            (identical(other.totalValue, totalValue) ||
                other.totalValue == totalValue) &&
            (identical(other.realizedGain, realizedGain) ||
                other.realizedGain == realizedGain) &&
            (identical(other.unrealizedGain, unrealizedGain) ||
                other.unrealizedGain == unrealizedGain) &&
            const DeepCollectionEquality()
                .equals(other._sectorAllocation, _sectorAllocation) &&
            (identical(other.totalTransactions, totalTransactions) ||
                other.totalTransactions == totalTransactions) &&
            (identical(other.averageTransactionSize, averageTransactionSize) ||
                other.averageTransactionSize == averageTransactionSize) &&
            (identical(other.lastUpdated, lastUpdated) ||
                other.lastUpdated == lastUpdated) &&
            const DeepCollectionEquality()
                .equals(other._topPerformers, _topPerformers) &&
            const DeepCollectionEquality()
                .equals(other._recentlyAdded, _recentlyAdded));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      totalStocks,
      activeSignals,
      averageReturn,
      profitablePositions,
      bestPerformer,
      bestSymbol,
      totalValue,
      realizedGain,
      unrealizedGain,
      const DeepCollectionEquality().hash(_sectorAllocation),
      totalTransactions,
      averageTransactionSize,
      lastUpdated,
      const DeepCollectionEquality().hash(_topPerformers),
      const DeepCollectionEquality().hash(_recentlyAdded));

  /// Create a copy of WatchlistSummary
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WatchlistSummaryImplCopyWith<_$WatchlistSummaryImpl> get copyWith =>
      __$$WatchlistSummaryImplCopyWithImpl<_$WatchlistSummaryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WatchlistSummaryImplToJson(
      this,
    );
  }
}

abstract class _WatchlistSummary implements WatchlistSummary {
  const factory _WatchlistSummary(
      {required final int totalStocks,
      required final int activeSignals,
      required final double averageReturn,
      required final int profitablePositions,
      required final double bestPerformer,
      required final String bestSymbol,
      required final double totalValue,
      final double realizedGain,
      final double unrealizedGain,
      final Map<String, double> sectorAllocation,
      final int totalTransactions,
      final double averageTransactionSize,
      final DateTime? lastUpdated,
      final List<String> topPerformers,
      final List<String> recentlyAdded}) = _$WatchlistSummaryImpl;

  factory _WatchlistSummary.fromJson(Map<String, dynamic> json) =
      _$WatchlistSummaryImpl.fromJson;

  @override
  int get totalStocks;
  @override
  int get activeSignals;
  @override
  double get averageReturn;
  @override
  int get profitablePositions;
  @override
  double get bestPerformer;
  @override
  String get bestSymbol;
  @override
  double get totalValue;
  @override
  double get realizedGain;
  @override
  double get unrealizedGain;
  @override
  Map<String, double> get sectorAllocation;
  @override
  int get totalTransactions;
  @override
  double get averageTransactionSize;
  @override
  DateTime? get lastUpdated;
  @override
  List<String> get topPerformers;
  @override
  List<String> get recentlyAdded;

  /// Create a copy of WatchlistSummary
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WatchlistSummaryImplCopyWith<_$WatchlistSummaryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
