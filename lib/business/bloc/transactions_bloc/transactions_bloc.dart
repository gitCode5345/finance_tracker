import 'package:finance_tracker/data/models/transaction/transaction.dart';
import 'package:finance_tracker/data/services/transactions/transactions_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';
part 'transactions_bloc.freezed.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  final TransactionsService transactionsService;

  String _currentPeriod = 'daily';
  String? _currentCategoryId;
  bool _isCategoryView = false;

  TransactionsBloc({required this.transactionsService}) : super(const _Initial()) {
    on<GetTransactionsEvent>(onGetTransaction);
    on<GetTransactionsByCategoryEvent>(onGetTransactionsByCategory);
    on<SaveTransactionEvent>(onSaveTransaction);
  }

  Future<void> onGetTransaction(GetTransactionsEvent e, Emitter emit) async {
    try {
      _currentPeriod = e.period;
      _isCategoryView = false;
      _currentCategoryId = null;

      emit(Loading(currentPeriod: _currentPeriod));
      
      final transactions = await transactionsService.getTransactionsByPeriod(e.period);
      
      emit(Updated(transactions, currentPeriod: _currentPeriod));
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }

  Future<void> onGetTransactionsByCategory(GetTransactionsByCategoryEvent e, Emitter emit) async {
    try {
      _currentCategoryId = e.categoryId;
      _isCategoryView = true;

      emit(Loading(currentPeriod: _currentPeriod));
      
      final transactions = await transactionsService.getTransactionsByCategory(
        e.categoryId, 
        period: e.period.isEmpty ? null : e.period,
      );
      
      emit(Updated(transactions, currentPeriod: _currentPeriod));
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }

  Future<void> onSaveTransaction(SaveTransactionEvent e, Emitter emit) async {
    try {
      emit(Loading(currentPeriod: _currentPeriod));
      await transactionsService.addTransaction(e.transaction);
      
      if (_isCategoryView && _currentCategoryId != null) {
        final transactions = await transactionsService.getTransactionsByCategory(
          _currentCategoryId!,
        );
        emit(Updated(transactions, currentPeriod: _currentPeriod)); 
      } else {
        final transactions = await transactionsService.getTransactionsByPeriod(_currentPeriod);
        emit(Updated(transactions, currentPeriod: _currentPeriod));
      }
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }
}
