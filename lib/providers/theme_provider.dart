// lib/providers/theme_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'theme_provider.g.dart';

// Create a provider for SharedPreferences
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

@Riverpod(keepAlive: true)
class ThemeModeNotifier extends _$ThemeModeNotifier {
  late SharedPreferences _prefs;

  @override
  ThemeMode build() {
    // Initialize SharedPreferences
    _prefs = ref.read(sharedPreferencesProvider);
    // Get the saved theme mode from SharedPreferences or use system default
    final savedThemeMode = _prefs.getString('themeMode');
    switch (savedThemeMode) {
      case 'dark':
        return ThemeMode.dark;
      case 'light':
        return ThemeMode.light;
      default:
        return ThemeMode.system;
    }
  }

  void setThemeMode(ThemeMode themeMode) {
    // Save the selected theme mode to SharedPreferences
    _prefs.setString('themeMode', themeMode.toString().split('.').last);
    state = themeMode;
  }
}

// Convenience provider for accessing the ThemeModeNotifier
final themeModeProvider =
    NotifierProvider<ThemeModeNotifier, ThemeMode>(ThemeModeNotifier.new);

@Riverpod(keepAlive: true)
class MyTheme extends _$MyTheme {
  late SharedPreferences _prefs;

  @override
  bool build() {
    // Initialize SharedPreferences
    _prefs = ref.read(sharedPreferencesProvider);
    // Get the saved theme preference from SharedPreferences or use a default value
    return _prefs.getBool('isDarkMode') ?? false;
  }

  void toggle() {
    state = !state;
    // Save the new theme preference to SharedPreferences
    _prefs.setBool('isDarkMode', state);
    // Update ThemeMode based on the new state
    ref.read(themeModeProvider.notifier).setThemeMode(
          state ? ThemeMode.dark : ThemeMode.light,
        );
  }
}
