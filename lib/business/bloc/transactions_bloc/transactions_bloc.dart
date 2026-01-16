import 'package:finance_tracker/data/models/transaction/transaction.dart';
import 'package:finance_tracker/data/services/transactions/transactions_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';
part 'transactions_bloc.freezed.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsService transactionsService;
  TransactionsBloc({required this.transactionsService}) : super(_Initial()) {
    on<GetTransactionsEvent>(onGetTransaction);
  }

  Future<void> onGetTransaction(GetTransactionsEvent e, Emitter emit) async {
    try {
      emit(Loading());
      final transactions = await transactionsService.getTransactionsByPeriod(e.period);
      emit(Updated(transactions: transactions));
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }
}
