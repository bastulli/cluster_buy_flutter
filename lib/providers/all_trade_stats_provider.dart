// lib/providers/all_trade_stats_provider.dart
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../repositories/insider_trade_repository.dart';
import '../models/insider_trade_models.dart';

part 'all_trade_stats_provider.g.dart';

@riverpod
Future<Map<String, TradeStats>> allTradeStats(AllTradeStatsRef ref) async {
  final repository = ref.watch(insiderTradeRepositoryProvider);
  return await repository.getAllTradeStats();
}
