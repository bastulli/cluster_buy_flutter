// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$themeModeNotifierHash() => r'4989c10864d9f7f716f0c7bbb8887d89bdc03549';

/// See also [ThemeModeNotifier].
@ProviderFor(ThemeModeNotifier)
final themeModeNotifierProvider =
    NotifierProvider<ThemeModeNotifier, ThemeMode>.internal(
  ThemeModeNotifier.new,
  name: r'themeModeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$themeModeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ThemeModeNotifier = Notifier<ThemeMode>;
String _$myThemeNotifierHash() => r'685e345c70b6d76a66fd4a647e90479481daf3bc';

/// See also [MyThemeNotifier].
@ProviderFor(MyThemeNotifier)
final myThemeNotifierProvider =
    AutoDisposeNotifierProvider<MyThemeNotifier, void>.internal(
  MyThemeNotifier.new,
  name: r'myThemeNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$myThemeNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$MyThemeNotifier = AutoDisposeNotifier<void>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
