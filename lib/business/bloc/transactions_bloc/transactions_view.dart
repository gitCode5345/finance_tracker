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

  TransactionsView copyWith({
    String? currentPeriod,
    List<Transaction>? transactions,
    Balance? balance,
    TransactionsGetCount? countTransactions,
    bool? hasReachedMax,
  }) {
    return TransactionsView(
      currentPeriod: currentPeriod ?? this.currentPeriod,
      transactions: transactions ?? this.transactions,
      balance: balance ?? this.balance,
      countTransactions: countTransactions ?? this.countTransactions,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
