import 'package:finance_tracker/core/const/transaction_type.dart';
import 'package:finance_tracker/data/models/transaction/transaction.dart';
import 'package:intl/intl.dart';
import 'package:finance_tracker/core/const/transactions_period.dart';

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
    final now = DateTime.now();
    if (viewMode == TransactionsPeriod.daily) {
      final startOfWeek = now.subtract(Duration(days: now.weekday - 1));
      final days = List.generate(7, (i) => DateTime(startOfWeek.year, startOfWeek.month, startOfWeek.day + i));

      final Map<int, ({double income, double expense})> data = {for (var i = 0; i < 7; i++) i: (income: 0.0, expense: 0.0)};

      for (var tx in this) {
        final txDate = tx.date.toLocal();
        for (var i = 0; i < days.length; i++) {
          final d = days[i];
          if (txDate.year == d.year && txDate.month == d.month && txDate.day == d.day) {
            final cur = data[i]!;
            if (tx.type == TransactionType.income) {
              data[i] = (income: cur.income + tx.amount, expense: cur.expense);
            } else {
              data[i] = (income: cur.income, expense: cur.expense + tx.amount);
            }
            break;
          }
        }
      }

      return data.entries.map((e) => ChartDataPoint(x: e.key, income: e.value.income, expense: e.value.expense)).toList();
    }

    if (viewMode == TransactionsPeriod.weekly) {
      final firstDayOfMonth = DateTime(now.year, now.month, 1);
      final startOfNextMonth = DateTime(now.year, now.month + 1, 1);
      final daysInMonth = startOfNextMonth.difference(firstDayOfMonth).inDays;

      final List<DateTime> weekStarts = [];
      for (var d = 0; d < daysInMonth; d += 7) {
        weekStarts.add(DateTime(firstDayOfMonth.year, firstDayOfMonth.month, firstDayOfMonth.day + d));
      }

      final Map<int, ({double income, double expense})> data = {for (var i = 0; i < weekStarts.length; i++) i: (income: 0.0, expense: 0.0)};

      for (var tx in this) {
        for (var i = 0; i < weekStarts.length; i++) {
          final start = weekStarts[i];
          final end = (i + 1 < weekStarts.length) ? weekStarts[i + 1] : startOfNextMonth;
          final txDate = tx.date.toLocal();
          if (!txDate.isBefore(start) && txDate.isBefore(end)) {
            final cur = data[i]!;
            if (tx.type == TransactionType.income) {
              data[i] = (income: cur.income + tx.amount, expense: cur.expense);
            } else {
              data[i] = (income: cur.income, expense: cur.expense + tx.amount);
            }
            break;
          }
        }
      }

      return data.entries.map((e) => ChartDataPoint(x: e.key, income: e.value.income, expense: e.value.expense)).toList();
    }

    if (viewMode == TransactionsPeriod.monthly) {
      const months = 12;
      final monthStarts = List.generate(months, (i) {
        final dt = DateTime(now.year, now.month - (months - 1 - i), 1);
        return dt;
      });

      final Map<int, ({double income, double expense})> data = {for (var i = 0; i < months; i++) i: (income: 0.0, expense: 0.0)};

      for (var tx in this) {
        for (var i = 0; i < monthStarts.length; i++) {
          final start = monthStarts[i];
          final end = DateTime(start.year, start.month + 1, 1);
          final txDate = tx.date.toLocal();
          if (!txDate.isBefore(start) && txDate.isBefore(end)) {
            final cur = data[i]!;
            if (tx.type == TransactionType.income) {
              data[i] = (income: cur.income + tx.amount, expense: cur.expense);
            } else {
              data[i] = (income: cur.income, expense: cur.expense + tx.amount);
            }
            break;
          }
        }
      }

      return data.entries.map((e) => ChartDataPoint(x: e.key, income: e.value.income, expense: e.value.expense)).toList();
    }

    const years = 3;
    final startYears = List.generate(years, (i) => DateTime(now.year - (years - 1 - i), 1, 1));

    final Map<int, ({double income, double expense})> data = {for (var i = 0; i < years; i++) i: (income: 0.0, expense: 0.0)};

    for (var tx in this) {
      for (var i = 0; i < startYears.length; i++) {
        final start = startYears[i];
        final end = DateTime(start.year + 1, 1, 1);
          final txDate = tx.date.toLocal();
          if (!txDate.isBefore(start) && txDate.isBefore(end)) {
          final cur = data[i]!;
          if (tx.type == TransactionType.income) {
            data[i] = (income: cur.income + tx.amount, expense: cur.expense);
          } else {
            data[i] = (income: cur.income, expense: cur.expense + tx.amount);
          }
          break;
        }
      }
    }

    return data.entries.map((e) => ChartDataPoint(x: e.key, income: e.value.income, expense: e.value.expense)).toList();
  }
}
