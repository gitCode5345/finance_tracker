import 'package:finance_tracker/core/const/transactions_period.dart';
import 'package:finance_tracker/core/const/transaction_type.dart';
import 'package:finance_tracker/data/models/balance/balance.dart';
import 'package:finance_tracker/data/models/transaction/transaction.dart';
import 'package:finance_tracker/data/models/transactions_get_count/transactions_get_count.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TransactionsService {
  SupabaseClient get _client => Supabase.instance.client;
  User? get user => _client.auth.currentUser;

  ({DateTime start, DateTime end}) _getRangeByPeriod(String period) {
    final nowLocal = DateTime.now();
    
    late DateTime startLocal;
    late DateTime endLocal;

    switch (period) {
      case TransactionsPeriod.daily:
        startLocal = DateTime(nowLocal.year, nowLocal.month, nowLocal.day);
        endLocal = startLocal.add(const Duration(days: 1));
        break;

      case TransactionsPeriod.weekly:
        final weekday = nowLocal.weekday;
        startLocal = DateTime(nowLocal.year, nowLocal.month, nowLocal.day)
            .subtract(Duration(days: weekday - 1));
        endLocal = startLocal.add(const Duration(days: 7));
        break;

      case TransactionsPeriod.monthly:
        startLocal = DateTime(nowLocal.year, nowLocal.month, 1);
        endLocal = DateTime(nowLocal.year, nowLocal.month + 1, 1);
        break;

        case TransactionsPeriod.yearly:
          startLocal = DateTime(nowLocal.year, 1, 1);
          endLocal = DateTime(nowLocal.year + 1, 1, 1);
          break;

      default:
        throw Exception('Unknown period');
    }

    return (
      start: startLocal.toUtc(),
      end: endLocal.toUtc(),
    );
  }

  Future<Balance> getTotalBalance() async {
    if (user == null) return Balance();

    final data = await _client
        .from('Transactions')
        .select('type, amount')
        .eq('user_id', user!.id);

    double income = 0.0;
    double expense = 0.0;

    for (var elem in data) {
      if (elem['type'] == TransactionType.income) {
        income += elem['amount'] as double;
      } else {
        expense += elem['amount'] as double;
      }
    }

    return Balance(
      totalBalance: income - expense,
      income: income, 
      expense: expense
    );
  }

  Future<List<Transaction>> getTransactionsByPeriod(String period, TransactionsGetCount count) async {
    if (user == null) return [];

    final range = _getRangeByPeriod(period);

    final data = await _client
        .from('Transactions')
        .select('*, category:Categories(*)')
        .eq('user_id', user!.id)
        .gte('date', range.start.toIso8601String())
        .lt('date', range.end.toIso8601String())
        .order('date', ascending: false)
        .range(count.firstPage, count.lastPage);

    return data
        .map<Transaction>((json) => Transaction.fromJson(json))
        .toList();
  }

  Future<List<Transaction>> getTransactionsByCategory(String categoryId, {String? period, required TransactionsGetCount count}) async {
    if (user == null) return [];

    var query = _client
        .from('Transactions')
        .select('*, category:Categories(*)')
        .eq('user_id', user!.id)
        .eq('category_id', categoryId);

    if (period != null && period.isNotEmpty) {
      final range = _getRangeByPeriod(period);
      query = query
        .gte('date', range.start.toIso8601String())
        .lt('date', range.end.toIso8601String());
    }

    final data = await query.order('date', ascending: false)
        .range(count.firstPage, count.lastPage);

    return data
        .map((e) => Transaction.fromJson(e))
        .toList();
  }


  Future<List<Transaction>> getAllTransactions(TransactionsGetCount count) async {
    if (user == null) return [];

    final data = await _client
        .from('Transactions')
        .select('*, category:Categories(*)')
        .eq('user_id', user!.id)
        .order('date', ascending: false)
        .range(count.firstPage, count.lastPage);

    return data
        .map<Transaction>((json) => Transaction.fromJson(json))
        .toList();
  }

  Future<void> addTransaction(Transaction transaction) async {
    if (user == null) return;

    final transactionData = {
      'title': transaction.title,
      'amount': transaction.amount,
      'date': transaction.date.toUtc().toIso8601String(),
      'type': transaction.type,
      'category_id': transaction.categoryId,
      'user_id': user!.id,
      'note': transaction.note,
    };

    await _client.from('Transactions').insert(transactionData);
  }

  Future<List<Transaction>> getTransactionsByType(String type, {String? period, TransactionsGetCount? count}) async {
    if (user == null) return [];

    var query = _client.from('Transactions').select('*, category:Categories(*)').eq('user_id', user!.id).eq('type', type);

    if (period != null && period.isNotEmpty) {
      final range = _getRangeByPeriod(period);
      query = query.gte('date', range.start.toIso8601String()).lt('date', range.end.toIso8601String());
    }

    if (count != null) {
      final data = await query.order('date', ascending: false).range(count.firstPage, count.lastPage);
      return data.map((e) => Transaction.fromJson(e)).toList();
    }

    final data = await query.order('date', ascending: false);
    return data.map((e) => Transaction.fromJson(e)).toList();
  }
}
