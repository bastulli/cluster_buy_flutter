// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'price_history_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$priceHistoryHash() => r'50cce6864999754114220c74e2aff4c459634699';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [priceHistory].
@ProviderFor(priceHistory)
const priceHistoryProvider = PriceHistoryFamily();

/// See also [priceHistory].
class PriceHistoryFamily extends Family<List<FlSpot>> {
  /// See also [priceHistory].
  const PriceHistoryFamily();

  /// See also [priceHistory].
  PriceHistoryProvider call(
    List<PricePoint>? history,
  ) {
    return PriceHistoryProvider(
      history,
    );
  }

  @override
  PriceHistoryProvider getProviderOverride(
    covariant PriceHistoryProvider provider,
  ) {
    return call(
      provider.history,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'priceHistoryProvider';
}

/// See also [priceHistory].
class PriceHistoryProvider extends AutoDisposeProvider<List<FlSpot>> {
  /// See also [priceHistory].
  PriceHistoryProvider(
    List<PricePoint>? history,
  ) : this._internal(
          (ref) => priceHistory(
            ref as PriceHistoryRef,
            history,
          ),
          from: priceHistoryProvider,
          name: r'priceHistoryProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$priceHistoryHash,
          dependencies: PriceHistoryFamily._dependencies,
          allTransitiveDependencies:
              PriceHistoryFamily._allTransitiveDependencies,
          history: history,
        );

  PriceHistoryProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.history,
  }) : super.internal();

  final List<PricePoint>? history;

  @override
  Override overrideWith(
    List<FlSpot> Function(PriceHistoryRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: PriceHistoryProvider._internal(
        (ref) => create(ref as PriceHistoryRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        history: history,
      ),
    );
  }

  @override
  AutoDisposeProviderElement<List<FlSpot>> createElement() {
    return _PriceHistoryProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is PriceHistoryProvider && other.history == history;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, history.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin PriceHistoryRef on AutoDisposeProviderRef<List<FlSpot>> {
  /// The parameter `history` of this provider.
  List<PricePoint>? get history;
}

class _PriceHistoryProviderElement
    extends AutoDisposeProviderElement<List<FlSpot>> with PriceHistoryRef {
  _PriceHistoryProviderElement(super.provider);

  @override
  List<PricePoint>? get history => (origin as PriceHistoryProvider).history;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
