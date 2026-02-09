import 'package:finance_tracker/core/const/transaction_type.dart';
import 'package:finance_tracker/data/models/transaction/transaction.dart';
import 'package:intl/intl.dart';
import 'package:finance_tracker/core/const/transactions_period.dart'; // Переконайся, що імпорт правильний

class ChartDataPoint {
  final int x;
  final double income;
  final double expense;

  ChartDataPoint({
    required this.x,
    required this.income,
    required this.expense,
  });
}

extension TransactionsGrouping on List<Transaction> {
  Map<int, Map<String, List<Transaction>>> groupByYearAndMonth() {
    final formatter = DateFormat('MMMM');
    final Map<int, Map<String, List<Transaction>>> grouped = {};

    for (final elem in this) {
      final year = elem.date.year;
      final month = formatter.format(elem.date);

      grouped.putIfAbsent(year, () => {});
      grouped[year]!.putIfAbsent(month, () => []);
      grouped[year]![month]!.add(elem);
    }

    return grouped;
  } 
}

extension TransactionCalculation on List<Transaction> {
  double get totalExpense => where(
    (element) => element.type == TransactionType.expense,)
    .fold(0, (sum, t) => sum + t.amount);

  double get totalIncome => where(
    (element) => element.type == TransactionType.income,)
    .fold(0, (sum, t) => sum + t.amount);

  double get totalBalance => totalIncome - totalExpense;
}

extension TransactionsByPeriod on List<Transaction> {
  List<Transaction> filterByPeriod(String period) {
    final now = DateTime.now();
    return where((transaction) {
      switch (period) {
        case TransactionsPeriod.daily:
           return transaction.date.year == now.year &&
                 transaction.date.month == now.month &&
                 transaction.date.day == now.day;
        case TransactionsPeriod.weekly:
          final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
          final endOfWeek = startOfWeek.add(const Duration(days: 7));
          return transaction.date.isAfter(startOfWeek.subtract(const Duration(seconds: 1))) && 
                 transaction.date.isBefore(endOfWeek);
        case TransactionsPeriod.monthly:
          return transaction.date.year == now.year &&
                 transaction.date.month == now.month;
        case TransactionsPeriod.yearly:
          return transaction.date.year == now.year;
        default:
          return false;
      }
    }).toList();
  }

  List<ChartDataPoint> calculateChartData(String viewMode) {
    Map<int, ({double income, double expense})> groupedData = {};
    int maxPoints = 7; 

    switch (viewMode) {
      case TransactionsPeriod.daily:
        maxPoints = 7;
        break;
      case TransactionsPeriod.weekly:
        maxPoints = 5; 
        break;
      case TransactionsPeriod.monthly:
      case TransactionsPeriod.yearly: 
        maxPoints = 12;
        break;
    }

    for (int i = 0; i < maxPoints; i++) {
      groupedData[i] = (income: 0.0, expense: 0.0);
    }

    for (var tx in this) {
      int index = 0;

      switch (viewMode) {
        case TransactionsPeriod.daily:
          index = tx.date.weekday - 1; 
          break;
        case TransactionsPeriod.weekly:
          index = ((tx.date.day - 1) / 7).floor();
          if (index >= 4) index = 4;
          break;
        case TransactionsPeriod.monthly:
        case TransactionsPeriod.yearly:
          index = tx.date.month - 1;
          break;
      }

      if (groupedData.containsKey(index)) {
        final current = groupedData[index]!;
        if (tx.type == TransactionType.income) {
          groupedData[index] = (
            income: current.income + tx.amount, 
            expense: current.expense
          );
        } else {
          groupedData[index] = (
            income: current.income, 
            expense: current.expense + tx.amount
          );
        }
      }
    }

    return groupedData.entries.map((e) {
      return ChartDataPoint(
        x: e.key,
        income: e.value.income,
        expense: e.value.expense,
      );
    }).toList();
  }
}
