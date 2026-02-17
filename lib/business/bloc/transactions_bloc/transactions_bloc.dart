import 'package:finance_tracker/data/models/balance/balance.dart';
import 'package:finance_tracker/data/models/transaction/transaction.dart';
import 'package:finance_tracker/data/models/transactions_get_count/transactions_get_count.dart';
import 'package:finance_tracker/business/bloc/transactions_bloc/transactions_view.dart';
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
    on<GetTransactionsSilentEvent>(onGetTransactionSilent);
    on<GetTransactionsByTypeSilentEvent>(onGetTransactionsByTypeSilent);
    on<GetAllTransactionsEvent>(onGetAllTransactions);
    on<GetTransactionsByCategoryEvent>(onGetTransactionsByCategory);
    on<GetTransactionsByTypeEvent>(onGetTransactionsByType);
    on<SaveTransactionEvent>(onSaveTransaction);
    on<LoadMoreTransactionsEvent>(onLoadMoreTransactions);
    on<RefreshTransactionsEvent>(onRefreshTransactions);
  }

  TransactionsView get _safeView => state.maybeWhen(
      loading: (view) => view ?? _defaultView,
      updated: (view) => view,
      silentUpdated: (view) => view,
      orElse: () => _defaultView,
    );

  TransactionsView get _defaultView => TransactionsView(
        balance: const Balance(),
        countTransactions: const TransactionsGetCount(firstPage: 0, lastPage: 49),
        transactions: [],
        currentPeriod: _currentPeriod,
      );

  void _emitLoading(Emitter emit) => emit(Loading(view: _safeView.copyWith(hasReachedMax: false)));

  Future<void> onGetTransactionSilent(GetTransactionsSilentEvent e, Emitter emit) async {
    try {
      _emitLoading(emit);
      final count = e.count ?? _safeView.countTransactions;

      final transactions = await transactionsService.getTransactionsByPeriod(e.period, count);
      final balance = await transactionsService.getTotalBalance();

      emit(TransactionsState.silentUpdated(_safeView.copyWith(
        currentPeriod: e.period,
        transactions: transactions,
        balance: balance,
        countTransactions: count,
        hasReachedMax: transactions.length < (count.lastPage - count.firstPage + 1),
      )));
    } catch (ex) {
      emit(Error(error: ex.toString()));
    }
  }

  Future<void> onGetTransaction(GetTransactionsEvent e, Emitter emit) async {
    _currentPeriod = e.period;
    await _loadTransactions(emit);
  }

  Future<void> onGetAllTransactions(GetAllTransactionsEvent e, Emitter emit) async {
    try {
      _isCategoryView = false;
      _currentCategoryId = null;
      _emitLoading(emit);

      final transactions = await transactionsService.getAllTransactions(count: _safeView.countTransactions);

      emit(Updated(_safeView.copyWith(
        currentPeriod: _currentPeriod,
        transactions: transactions,
        hasReachedMax: transactions.length < (_safeView.countTransactions.lastPage - _safeView.countTransactions.firstPage + 1),
      )));
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }

  Future<void> onGetTransactionsByCategory(GetTransactionsByCategoryEvent e, Emitter emit) async {
    try {
      _currentCategoryId = e.categoryId;
      _isCategoryView = true;
      _emitLoading(emit);

      final transactions = await transactionsService.getTransactionsByCategory(
        e.categoryId,
        period: e.period.isEmpty ? null : e.period,
        count: _safeView.countTransactions,
      );

      emit(Updated(_safeView.copyWith(
        transactions: transactions,
        hasReachedMax: transactions.length < (_safeView.countTransactions.lastPage - _safeView.countTransactions.firstPage + 1),
      )));
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }

  Future<void> onGetTransactionsByType(GetTransactionsByTypeEvent e, Emitter emit) async {
    try {
      _emitLoading(emit);
      final transactions = await transactionsService.getTransactionsByType(e.type, count: _safeView.countTransactions);

      emit(Updated(_safeView.copyWith(
        transactions: transactions,
        hasReachedMax: transactions.length < (_safeView.countTransactions.lastPage - _safeView.countTransactions.firstPage + 1),
      )));
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }

  Future<void> onGetTransactionsByTypeSilent(GetTransactionsByTypeSilentEvent e, Emitter emit) async {
    try {
      _emitLoading(emit);
      final count = e.count ?? _safeView.countTransactions;

      final transactions = await transactionsService.getTransactionsByType(e.type, period: e.period, count: count);

      emit(TransactionsState.silentUpdated(_safeView.copyWith(
        transactions: transactions,
        countTransactions: count,
        currentPeriod: e.period,
        hasReachedMax: transactions.length < (count.lastPage - count.firstPage + 1),
      )));
    } catch (ex) {
      emit(Error(error: ex.toString()));
    }
  }

  Future<void> onSaveTransaction(SaveTransactionEvent e, Emitter emit) async {
    try {
      _emitLoading(emit);
      await transactionsService.addTransaction(e.transaction);

      final transactions = _isCategoryView && _currentCategoryId != null
          ? await transactionsService.getTransactionsByCategory(_currentCategoryId!, count: _safeView.countTransactions)
          : await transactionsService.getTransactionsByPeriod(_currentPeriod, _safeView.countTransactions);

      final balance = await transactionsService.getTotalBalance();

      emit(Updated(_safeView.copyWith(
        transactions: transactions,
        balance: balance,
        hasReachedMax: transactions.length < (_safeView.countTransactions.lastPage - _safeView.countTransactions.firstPage + 1),
      )));
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }

  Future<void> onLoadMoreTransactions(LoadMoreTransactionsEvent e, Emitter emit) async {
    final view = _safeView;
    if (view.hasReachedMax) return;

    final newCount = TransactionsGetCount(
      firstPage: view.countTransactions.lastPage + 1,
      lastPage: view.countTransactions.lastPage + 50,
    );

    try {
      List<Transaction> newTransactions;
      if (_isCategoryView && _currentCategoryId != null) {
        newTransactions = await transactionsService.getTransactionsByCategory(_currentCategoryId!, period: _currentPeriod, count: newCount);
      } else if (_currentPeriod.isNotEmpty) {
        newTransactions = await transactionsService.getTransactionsByPeriod(_currentPeriod, newCount);
      } else {
        newTransactions = await transactionsService.getAllTransactions(count: newCount);
      }

      if (newTransactions.isEmpty) {
        emit(Updated(view.copyWith(hasReachedMax: true)));
        return;
      }

      emit(Updated(view.copyWith(
        transactions: [...?view.transactions, ...newTransactions],
        countTransactions: newCount,
      )));
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }

  Future<void> onRefreshTransactions(RefreshTransactionsEvent e, Emitter emit) async {
    await _loadTransactions(emit);
  }

  Future<void> _loadTransactions(Emitter emit) async {
    try {
      _isCategoryView = false;
      _currentCategoryId = null;
      _emitLoading(emit);

      const initialCount = TransactionsGetCount(firstPage: 0, lastPage: 49);
      final transactions = await transactionsService.getTransactionsByPeriod(_currentPeriod, initialCount);
      final balance = await transactionsService.getTotalBalance();

      emit(Updated(_safeView.copyWith(
        currentPeriod: _currentPeriod,
        transactions: transactions,
        balance: balance,
        countTransactions: initialCount,
        hasReachedMax: false,
      )));
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }
}
