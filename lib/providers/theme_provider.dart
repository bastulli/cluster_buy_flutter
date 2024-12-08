// lib/providers/theme_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
class MyTheme extends _$MyTheme {
  @override
  bool build() => true; // Start with dark mode

  void toggle() => state = !state;
}
