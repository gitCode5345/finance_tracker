import 'package:finance_tracker/data/models/extensions/transactions_extension.dart';

class AnalyticsView {
  List<ChartDataPoint> data;
  double totalIncome;
  double totalExpense;
  String period;

  AnalyticsView({
    required this.data,
    required this.totalIncome,
    required this.totalExpense,
    required this.period,
  });

  AnalyticsView copyWith({
    List<ChartDataPoint>? data,
    double? totalIncome,
    double? totalExpense,
    String? period,
  }) {
    return AnalyticsView(
      data: data ?? this.data,
      totalIncome: totalIncome ?? this.totalIncome,
      totalExpense: totalExpense ?? this.totalExpense,
      period: period ?? this.period,
    );
  }
}