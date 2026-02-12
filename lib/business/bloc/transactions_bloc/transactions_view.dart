import 'package:finance_tracker/data/models/balance/balance.dart';
import 'package:finance_tracker/data/models/transaction/transaction.dart';
import 'package:finance_tracker/data/models/transactions_get_count/transactions_get_count.dart';

class TransactionsView {
  final String? currentPeriod;
  final List<Transaction>? transactions;
  final Balance balance;
  final TransactionsGetCount countTransactions;
  final bool hasReachedMax;

  const TransactionsView({
    this.currentPeriod,
    this.transactions,
    required this.balance,
    required this.countTransactions,
    this.hasReachedMax = false,
  });
}
