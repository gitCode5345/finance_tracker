import 'package:finance_tracker/core/const/transactions_period.dart';
import 'package:finance_tracker/data/models/transaction/transaction.dart';
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

      default:
        throw Exception('Unknown period');
    }

    return (
      start: startLocal.toUtc(),
      end: endLocal.toUtc(),
    );
  }

  Future<List<Transaction>> getTransactionsByPeriod(String period) async {
    if (user == null) return [];

    final range = _getRangeByPeriod(period);

    final data = await _client
        .from('Transactions')
        .select()
        .eq('user_id', user!.id)
        .gte('created_at', range.start)
        .lt('created_at', range.end);

    return data
        .map<Transaction>((json) => Transaction.fromJson(json))
        .toList();
  }
}
