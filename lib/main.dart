// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'providers/theme_provider.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://mluudemztztnciotpsor.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im1sdXVkZW16dHp0bmNpb3Rwc29yIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzMwNjk0MDMsImV4cCI6MjA0ODY0NTQwM30.3Y0CZ4VzDU-JipTGECjZ0GrUbc_uBHUsdxiy2RNLzwY',
  );

  runApp(const ProviderScope(child: StockAnalyzerApp()));
}

final supabase = Supabase.instance.client;

class StockAnalyzerApp extends ConsumerWidget {
  const StockAnalyzerApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(myThemeProvider);

    return MaterialApp(
      title: 'Cluster Buy',
      theme: _buildTheme(isDarkMode),
      home: const HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }

  ThemeData _buildTheme(bool isDarkMode) {
    // Get the base theme from FlexColorScheme
    final baseScheme = isDarkMode
        ? FlexScheme.jungle // Green scheme for dark mode
        : FlexScheme.money; // Green scheme for light mode

    // Create the FlexColorScheme with custom settings
    final flexScheme = isDarkMode
        ? FlexColorScheme.dark(
            scheme: baseScheme,
            surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
            blendLevel: 12,
            subThemesData: const FlexSubThemesData(
              blendOnLevel: 20,
              blendOnColors: false,
              defaultRadius: 12.0,
              elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
              elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
              cardRadius: 12.0,
              popupMenuRadius: 8.0,
              navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
              navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
              navigationBarMutedUnselectedLabel: false,
              navigationBarSelectedIconSchemeColor: SchemeColor.primary,
              navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
              navigationBarMutedUnselectedIcon: false,
              navigationBarBackgroundSchemeColor: SchemeColor.surface,
            ),
          )
        : FlexColorScheme.light(
            scheme: baseScheme,
            surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
            blendLevel: 12,
            subThemesData: const FlexSubThemesData(
              blendOnLevel: 20,
              blendOnColors: false,
              defaultRadius: 12.0,
              elevatedButtonSchemeColor: SchemeColor.onPrimaryContainer,
              elevatedButtonSecondarySchemeColor: SchemeColor.primaryContainer,
              cardRadius: 12.0,
              popupMenuRadius: 8.0,
              navigationBarSelectedLabelSchemeColor: SchemeColor.primary,
              navigationBarUnselectedLabelSchemeColor: SchemeColor.onSurface,
              navigationBarMutedUnselectedLabel: false,
              navigationBarSelectedIconSchemeColor: SchemeColor.primary,
              navigationBarUnselectedIconSchemeColor: SchemeColor.onSurface,
              navigationBarMutedUnselectedIcon: false,
              navigationBarBackgroundSchemeColor: SchemeColor.surface,
            ),
          );

    // Build the theme and customize text
    final theme = flexScheme.toTheme.copyWith(
      textTheme: GoogleFonts.spaceGroteskTextTheme(
        isDarkMode ? ThemeData.dark().textTheme : ThemeData.light().textTheme,
      ),
    );

    // Add custom theme overrides
    return theme.copyWith(
      cardTheme: theme.cardTheme.copyWith(
        elevation: 2,
        surfaceTintColor: Colors.transparent,
        clipBehavior: Clip.antiAlias,
      ),
      navigationBarTheme: theme.navigationBarTheme.copyWith(
        elevation: 0,
        height: 65,
      ),
      appBarTheme: theme.appBarTheme.copyWith(
        surfaceTintColor: Colors.transparent,
      ),
      scaffoldBackgroundColor: theme.colorScheme.surface,
      // Add smooth transitions for theme changes
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }
}
