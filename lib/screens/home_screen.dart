// lib/screens/home_screen.dart
import 'package:clusterbuy/providers/insider_trade_providers.dart';
import 'package:clusterbuy/providers/watchlist_summary_provider.dart';
import 'package:clusterbuy/widgets/finance_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import '../models/insider_trade_models.dart';
import '../providers/all_trade_stats_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/signal_card.dart';
import '../widgets/performance_chart.dart';
import '../widgets/metrics_header.dart';
import '../widgets/watchlist_summary_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final currencyFormatter =
      NumberFormat.currency(symbol: '\$', decimalDigits: 2);
  final compactFormatter = NumberFormat.compactCurrency(symbol: '\$');
  final dateFormatter = DateFormat('MMM d, y');
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDarkMode = ref.watch(myThemeProvider);

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(allTradeStatsProvider);
          ref.invalidate(watchlistNotifierProvider);
          ref.invalidate(recentTransactionsNotifierProvider);
        },
        child: CustomScrollView(
          slivers: [
            _buildAppBar(theme, isDarkMode),
            // Stats Header with max width
            SliverToBoxAdapter(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: _buildStatsHeader(),
                ),
              ),
            ),
            // Navigation Bar with max width
            SliverToBoxAdapter(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: _buildNavigationBar(),
                ),
              ),
            ),
            // Main Content with max width
            SliverToBoxAdapter(
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1200),
                  child: _buildMainContent(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar(ThemeData theme, bool isDarkMode) {
    return SliverAppBar(
      shadowColor: theme.colorScheme.primary.withOpacity(0.5),
      elevation: 8.0,
      floating: true,
      pinned: true,
      expandedHeight: 120.0, // Reduced from 140
      clipBehavior: Clip.antiAlias,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.zero,
        title: LayoutBuilder(
          builder: (context, constraints) {
            // Get the screen width
            final width = MediaQuery.of(context).size.width;

            // Calculate font size based on screen width
            final fontSize = width < 360
                ? 24.0
                : // Small mobile
                width < 600
                    ? 32.0
                    : // Regular mobile
                    width < 900
                        ? 38.0
                        : // Tablet
                        42.0; // Desktop

            // Calculate container padding based on screen size
            final verticalPadding = width < 600 ? 12.0 : 16.0;

            return Container(
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding,
                horizontal: width < 600 ? 16.0 : 24.0,
              ),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    theme.colorScheme.primary.withOpacity(0.0),
                    theme.colorScheme.primary.withOpacity(0.8),
                  ],
                ),
              ),
              child: Text(
                'CLUSTER BUY',
                style: GoogleFonts.roboto(
                  textStyle: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: fontSize,
                    fontWeight: FontWeight.w800,
                    letterSpacing:
                        fontSize * 0.04, // Proportional letter spacing
                    height: 1.2,
                  ),
                ),
              ),
            );
          },
        ),
        background: Stack(
          children: [
            // Semi-transparent gradient overlay
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    isDarkMode
                        ? theme.colorScheme.primary.withOpacity(0.85)
                        : theme.colorScheme.primary.withOpacity(0.85),
                    isDarkMode
                        ? theme.colorScheme.primary.withOpacity(0.75)
                        : theme.colorScheme.primary.withOpacity(0.75),
                    isDarkMode
                        ? theme.colorScheme.primary.withOpacity(0.85)
                        : theme.colorScheme.primary.withOpacity(0.85),
                  ],
                  stops: const [0.0, 0.5, 1.0],
                ),
              ),
            ),
            // Animation with higher opacity
            AnimatedFinanceBackground(
              isDarkMode: theme.brightness == Brightness.dark,
              lineColor: theme.colorScheme.onPrimary.withOpacity(0.3),
            ),
          ],
        ),
      ),
      actions: [
        // Responsive padding for actions
        Padding(
          padding: EdgeInsets.only(
            right: MediaQuery.of(context).size.width < 600 ? 4.0 : 8.0,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(isDarkMode ? Icons.light_mode : Icons.dark_mode),
                color: theme.colorScheme.onPrimary,
                onPressed: () => ref.read(myThemeProvider.notifier).toggle(),
              ),
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                color: theme.colorScheme.onPrimary,
                onPressed: () {
                  // TODO: Implement notifications
                },
              ),
            ],
          ),
        ),
      ],
      backgroundColor:
          isDarkMode ? theme.colorScheme.primary : theme.colorScheme.primary,
    );
  }

  Widget _buildStatsHeader() {
    return MetricsHeader();
  }

  Widget _buildNavigationBar() {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          Card(
            elevation: 3,
            shadowColor: theme.colorScheme.primary.withOpacity(0.2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
              side: BorderSide(
                color: theme.colorScheme.primary.withOpacity(0.1),
                width: 1,
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    theme.colorScheme.surface,
                    theme.colorScheme.surface.withOpacity(0.9),
                  ],
                ),
              ),
              child: NavigationBar(
                height: 80,
                backgroundColor: Colors.transparent,
                indicatorColor:
                    theme.colorScheme.primaryContainer.withOpacity(0.8),
                selectedIndex: _selectedIndex,
                labelBehavior:
                    NavigationDestinationLabelBehavior.onlyShowSelected,
                animationDuration: const Duration(milliseconds: 500),
                onDestinationSelected: (int index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                destinations: [
                  NavigationDestination(
                    icon: Icon(
                      Icons.signal_cellular_alt_outlined,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    selectedIcon: Icon(
                      size: 42,
                      Icons.signal_cellular_alt,
                      color: theme.colorScheme.primary,
                    ),
                    label: 'Signals',
                  ),
                  NavigationDestination(
                    icon: Icon(
                      Icons.trending_up_outlined,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    selectedIcon: Icon(
                      size: 42,
                      Icons.trending_up,
                      color: theme.colorScheme.primary,
                    ),
                    label: 'Performance',
                  ),
                  NavigationDestination(
                    icon: Icon(
                      Icons.history_outlined,
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                    selectedIcon: Icon(
                      size: 42,
                      Icons.history,
                      color: theme.colorScheme.primary,
                    ),
                    label: 'Trades',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent() {
    Widget content;
    switch (_selectedIndex) {
      case 0:
        content = _buildSignalsTab();
        break;
      case 1:
        content = _buildPerformanceTab();
        break;
      case 2:
        content = _buildTradesTab();
        break;
      default:
        content = const SizedBox.shrink();
        break;
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: content,
    );
  }

  Widget _buildSignalsTab() {
    final watchlistAsync = ref.watch(watchlistNotifierProvider);

    return watchlistAsync.when(
      data: (stocks) => stocks.isEmpty
          ? const Center(
              child: Text('No signals in watchlist'),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (var stock in stocks)
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: SignalCard(stock: stock),
                  ),
              ],
            ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Text('Error: $e'),
    );
  }

  Widget _buildPerformanceTab() {
    final summaryAsync = ref.watch(watchlistSummaryProvider);

    return summaryAsync.when(
      data: (summary) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const PerformanceChart(),
          const SizedBox(height: 16),
          WatchlistSummaryCard(),
        ],
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Text('Error: $e'),
    );
  }

  Widget _buildTradesTab() {
    final transactionsAsync = ref.watch(recentTransactionsNotifierProvider);

    return transactionsAsync.when(
      data: (transactions) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: transactions.map((tx) => _buildTradeCard(tx)).toList(),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Error: $e')),
    );
  }

  Widget _buildTradeCard(InsiderTransaction transaction) {
    final theme = Theme.of(context);
    final isPurchase =
        transaction.transactionType.toLowerCase().contains('purchase');

    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () async {
          if (transaction.link != null && transaction.link!.isNotEmpty) {
            final url = Uri.parse(transaction.link!);
            if (await canLaunchUrl(url)) {
              await launchUrl(url);
            } else {
              // Handle the error, perhaps show a message to the user
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Could not launch ${transaction.link}')),
              );
            }
          }
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    transaction.symbol,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 8),
                  _buildTransactionTypeBadge(transaction, theme),
                  const Spacer(),
                  Text(
                    transaction.totalValue != null
                        ? currencyFormatter.format(transaction.totalValue)
                        : 'N/A',
                    style: TextStyle(
                      color: isPurchase
                          ? theme.colorScheme.tertiary
                          : theme.colorScheme.error,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          transaction.reportingName,
                          style: theme.textTheme.bodyMedium,
                        ),
                        Text(
                          transaction.typeOfOwner ?? 'Unknown',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${NumberFormat("#,##0").format(transaction.securitiesTransacted ?? 0)} shares',
                        style: theme.textTheme.bodyMedium,
                      ),
                      Text(
                        transaction.price != null
                            ? '@${currencyFormatter.format(transaction.price)}/share'
                            : 'Price Unavailable',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: theme.colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Filed: ${dateFormatter.format(transaction.filingDate)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                  if (transaction.link != null && transaction.link!.isNotEmpty)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.launch,
                          size: 16,
                          color: theme.colorScheme.primary,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          'View Filing',
                          style: TextStyle(
                            color: theme.colorScheme.primary,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTransactionTypeBadge(
      InsiderTransaction transaction, ThemeData theme) {
    final isPurchase =
        transaction.transactionType.toLowerCase().contains('purchase');
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color:
            (isPurchase ? theme.colorScheme.tertiary : theme.colorScheme.error)
                .withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        transaction.transactionType,
        style: theme.textTheme.bodySmall?.copyWith(
          color:
              isPurchase ? theme.colorScheme.tertiary : theme.colorScheme.error,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
