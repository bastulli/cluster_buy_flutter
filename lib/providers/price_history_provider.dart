import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fl_chart/fl_chart.dart';
import '../models/insider_trade_models.dart';

part 'price_history_provider.g.dart';

@riverpod
List<FlSpot> priceHistory(PriceHistoryRef ref, List<PricePoint>? history) {
  if (history == null || history.isEmpty) return [];

  final sortedHistory = [...history]..sort((a, b) => a.date.compareTo(b.date));
  final points = sortedHistory.length > 30
      ? sortedHistory.sublist(sortedHistory.length - 30)
      : sortedHistory;

  return points
      .asMap()
      .entries
      .map((e) => FlSpot(e.key.toDouble(), e.value.price))
      .toList();
}
