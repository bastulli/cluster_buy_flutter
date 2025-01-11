import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'shared_preferences_provider.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  ThemeMode build() {
    // Watch the FutureProvider and handle its state
    final sharedPrefsAsync = ref.watch(sharedPreferencesProvider);

    return sharedPrefsAsync.when(
      data: (sharedPrefs) => _getInitialThemeMode(sharedPrefs),
      loading: () =>
          ThemeMode.system, // Or your preferred default while loading
      error: (error, stack) => ThemeMode.system, // Handle errors gracefully
    );
  }

  ThemeMode _getInitialThemeMode(SharedPreferences prefs) {
    final savedThemeMode = prefs.getString('themeMode');

    if (savedThemeMode == 'dark') {
      return ThemeMode.dark;
    } else if (savedThemeMode == 'light') {
      return ThemeMode.light;
    }

    final systemBrightness =
        WidgetsBinding.instance.platformDispatcher.platformBrightness;
    return systemBrightness == Brightness.dark
        ? ThemeMode.dark
        : ThemeMode.light;
  }

  void setThemeMode(ThemeMode themeMode) async {
    final sharedPrefs = await ref.read(sharedPreferencesProvider.future);
    sharedPrefs.setString('themeMode', themeMode.toString().split('.').last);
    state = themeMode;
  }
}

final themeModeProvider =
    NotifierProvider<ThemeModeNotifier, ThemeMode>(ThemeModeNotifier.new);

@riverpod
class MyThemeNotifier extends _$MyThemeNotifier {
  @override
  void build() {}

  void toggle() async {
    final sharedPrefs = await ref.read(sharedPreferencesProvider.future);
    final currentThemeMode = ref.read(themeModeProvider);
    final newThemeMode =
        currentThemeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    ref.read(themeModeProvider.notifier).setThemeMode(newThemeMode);
    sharedPrefs.setString('themeMode', newThemeMode.toString().split('.').last);
  }
}
