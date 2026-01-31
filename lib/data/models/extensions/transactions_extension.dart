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