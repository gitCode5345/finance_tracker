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
    on<GetTransactionsByCategoryEvent>(onGetTransactionsByCategory);
    on<SaveTransactionEvent>(onSaveTransaction);
  }

  Future<void> onGetTransaction(GetTransactionsEvent e, Emitter emit) async {
    try {
      emit(Loading(currentPeriod: e.period));
      final transactions = await transactionsService.getTransactionsByPeriod(e.period);
      emit(Updated(transactions, currentPeriod: e.period));
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }

  Future<void> onGetTransactionsByCategory(GetTransactionsByCategoryEvent e, Emitter emit) async {
    try {
      emit(Loading());
      final transactions = await transactionsService.getTransactionsByCategory(
        e.categoryId, 
        period: e.period.isEmpty ? null : e.period,
      );
    emit(Updated(transactions));
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }

  Future<void> onSaveTransaction(SaveTransactionEvent e, Emitter emit) async {
    try {
      emit(Loading());
      await transactionsService.addTransaction(e.transaction);
      emit(Updated(await transactionsService.getTransactionsByPeriod('daily')));
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }
}
