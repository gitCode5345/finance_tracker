import 'package:finance_tracker/data/models/enums/transaction_type_enum.dart';
import 'package:finance_tracker/data/models/transaction/transaction.dart';
import 'package:intl/intl.dart';

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
