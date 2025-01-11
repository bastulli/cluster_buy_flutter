// lib/screens/home_screen.dart
import 'package:clusterbuy/providers/insider_trade_providers.dart';
import 'package:clusterbuy/widgets/finance_background.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../models/insider_trade_models.dart';
import '../providers/all_trade_stats_provider.dart';
import '../providers/theme_provider.dart';
import '../widgets/signal_card.dart';
import '../widgets/metrics_header.dart';
import '../services/notification_service.dart';

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
  int _currentPage = 0;
  final int _transactionsPerPage = 10;
  final ScrollController _scrollController = ScrollController();
  double _titleFontSize = 42.0; // Initial font size

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    // Calculate font size based on scroll position
    double newSize = 42.0 - _scrollController.offset / 5.0;
    if (newSize < 24.0) newSize = 24.0; // Minimum font size
    if (newSize != _titleFontSize) {
      setState(() {
        _titleFontSize = newSize;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    // In HomeScreen's build method:
    final themeMode = ref.watch(themeModeProvider);
    final isDarkMode = themeMode == ThemeMode.dark;

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(allTradeStatsProvider);
          ref.invalidate(watchlistNotifierProvider);
          ref.invalidate(recentTransactionsNotifierProvider);
        },
        child: CustomScrollView(
          controller: _scrollController,
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
      expandedHeight: 120.0,
      clipBehavior: Clip.antiAlias,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.zero,
        title: LayoutBuilder(
          builder: (context, constraints) {
            // Get the screen width
            final width = MediaQuery.of(context).size.width;

            // Calculate font size based on screen width, but also consider the dynamic _titleFontSize
            double fontSize = _titleFontSize;
            if (width < 360) {
              fontSize =
                  _titleFontSize < 24.0 ? 24.0 : _titleFontSize; // Small mobile
            } else if (width < 600) {
              fontSize = _titleFontSize < 32.0
                  ? 32.0
                  : _titleFontSize; // Regular mobile
            } else if (width < 900) {
              fontSize =
                  _titleFontSize < 38.0 ? 38.0 : _titleFontSize; // Tablet
            }

            // Calculate container padding based on screen size
            final verticalPadding = width < 600 ? 12.0 : 16.0;

            return Container(
              padding: EdgeInsets.symmetric(
                vertical: verticalPadding,
                horizontal: width < 600 ? 16.0 : 24.0,
              ),
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Stack(
                  children: [
                    // Outline text
                    Text(
                      'CLUSTER BUY',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: fontSize,
                          fontWeight: FontWeight.w800,
                          letterSpacing: fontSize * 0.04,
                          height: 1.2,
                          foreground: Paint()
                            ..style = PaintingStyle.stroke
                            ..strokeWidth = 2
                            ..color = theme.colorScheme.primary,
                        ),
                      ),
                    ),
                    // Filled text
                    Text(
                      'CLUSTER BUY',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          color: theme.colorScheme.onPrimary,
                          fontSize: fontSize,
                          fontWeight: FontWeight.w800,
                          letterSpacing: fontSize * 0.04,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ],
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
                onPressed: () =>
                    ref.read(myThemeNotifierProvider.notifier).toggle(),
              ),
              Consumer(
                builder: (context, ref, child) {
                  return IconButton(
                    icon: const Icon(Icons.notifications_outlined),
                    color: theme.colorScheme.onPrimary,
                    onPressed: () async {
                      final notificationService =
                          ref.read(notificationServiceProvider);
                      final settings = await notificationService.initialize();

                      if (context.mounted && settings != null) {
                        if (settings.authorizationStatus ==
                            AuthorizationStatus.authorized) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Notifications enabled'),
                              backgroundColor: Colors.green,
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'Please enable notifications in your browser settings'),
                              backgroundColor: Colors.orange,
                            ),
                          );
                        }
                      }
                    },
                  );
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
    return const MetricsHeader();
  }

  Widget _buildNavigationBar() {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          // Use an ElevatedButton or FilledButton for a more prominent button style
          Container(
            decoration: BoxDecoration(
              color: theme.colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the buttons
              children: [
                // Signals Button
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 0;
                      });
                    },
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: _selectedIndex == 0
                            ? theme.colorScheme.primary.withOpacity(0.2)
                            : null,
                        borderRadius: BorderRadius.horizontal(
                            left: const Radius.circular(24),
                            right: _selectedIndex == 0
                                ? Radius.zero
                                : const Radius.circular(24)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.signal_cellular_alt,
                            size: 28, // Reduced size
                            color: _selectedIndex == 0
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Signals',
                            style: TextStyle(
                              fontWeight: _selectedIndex == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: _selectedIndex == 0
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                // Trades Button
                Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedIndex = 1;
                      });
                    },
                    borderRadius: BorderRadius.circular(24),
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: _selectedIndex == 1
                            ? theme.colorScheme.primary.withOpacity(0.2)
                            : null,
                        borderRadius: BorderRadius.horizontal(
                            right: const Radius.circular(24),
                            left: _selectedIndex == 1
                                ? Radius.zero
                                : const Radius.circular(24)),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.history,
                            size: 28, // Reduced size
                            color: _selectedIndex == 1
                                ? theme.colorScheme.primary
                                : theme.colorScheme.onSurfaceVariant,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Trades',
                            style: TextStyle(
                              fontWeight: _selectedIndex == 1
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                              color: _selectedIndex == 1
                                  ? theme.colorScheme.primary
                                  : theme.colorScheme.onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
    final theme = Theme.of(context);

    return watchlistAsync.when(
      data: (stocks) => stocks.isEmpty
          ? Column(
              children: [
                _buildQuoteCard(theme),
                SizedBox(height: 16),
                Center(
                  child: Text('No signals in watchlist'),
                ),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildQuoteCard(theme),
                SizedBox(height: 16),
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

  Widget _buildTradesTab() {
    final transactionsAsync = ref.watch(recentTransactionsNotifierProvider);

    return transactionsAsync.when(
      data: (transactions) {
        final startIndex = _currentPage * _transactionsPerPage;
        final endIndex =
            (_currentPage + 1) * _transactionsPerPage < transactions.length
                ? (_currentPage + 1) * _transactionsPerPage
                : transactions.length;
        final pageTransactions = transactions.sublist(startIndex, endIndex);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ...pageTransactions.map((tx) => _buildTradeCard(tx)),
            const SizedBox(height: 16),
            _buildPaginationControls(transactions.length),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Error: $e')),
    );
  }

  Widget _buildPaginationControls(int totalTransactions) {
    final theme = Theme.of(context);
    final totalPages = (totalTransactions / _transactionsPerPage).ceil();

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: _currentPage > 0
              ? () {
                  setState(() {
                    _currentPage--;
                  });
                }
              : null,
        ),
        const SizedBox(width: 16),
        Text(
          'Page ${_currentPage + 1} of $totalPages',
          style: theme.textTheme.bodyLarge,
        ),
        const SizedBox(width: 16),
        IconButton(
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: _currentPage < totalPages - 1
              ? () {
                  setState(() {
                    _currentPage++;
                  });
                }
              : null,
        ),
      ],
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
                .withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        isPurchase ? 'P' : 'S',
        style: theme.textTheme.bodySmall?.copyWith(
          color:
              isPurchase ? theme.colorScheme.tertiary : theme.colorScheme.error,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildQuoteCard(ThemeData theme) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        onTap: () async {
          final url = Uri.parse('https://en.wikipedia.org/wiki/Peter_Lynch');
          if (await canLaunchUrl(url)) {
            await launchUrl(url);
          }
        },
        child: Padding(
          padding:
              const EdgeInsets.all(24), // Adjusted padding for better spacing
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Insiders might sell their shares for any number of reasons, but they buy them for only one...',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontSize: 24, // Adjusted font size for better readability
                  height: 1.4,
                  fontStyle: FontStyle.italic, // Added italic style
                ),
              ),
              const SizedBox(
                  height: 16), // Added spacing between quote and author
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  '- Peter Lynch',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontSize: 18, // Adjusted font size for author name
                    fontStyle: FontStyle.italic, // Added italic style
                    color: theme.colorScheme.onSurfaceVariant, // Adjusted color
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
