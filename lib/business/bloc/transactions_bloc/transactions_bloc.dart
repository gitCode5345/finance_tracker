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

  TransactionsService get service => transactionsService;

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

  Future<void> onGetTransactionSilent(GetTransactionsSilentEvent e, Emitter emit) async {
    try {
      final count = e.count ?? TransactionsGetCount(firstPage: 0, lastPage: 49);

      final currentView = state.maybeWhen(
        updated: (view) => view,
        loading: (view) => view,
        silentUpdated: (view) => view,
        orElse: () => null,
      );

      emit(Loading(view: currentView));

      final transactions = await transactionsService.getTransactionsByPeriod(e.period, count);
      final balance = await transactionsService.getTotalBalance();

      final pageSize = count.lastPage - count.firstPage + 1;
      final reachedMax = transactions.length < pageSize;

      emit(TransactionsState.silentUpdated(TransactionsView(currentPeriod: e.period, transactions: transactions, balance: balance, countTransactions: count, hasReachedMax: reachedMax)));
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

      final previousTransactions = state.maybeWhen(
        loading: (view) => view?.transactions ?? <Transaction>[],
        updated:(view) => view.transactions,
        silentUpdated: (view) => view.transactions,
        orElse: () => <Transaction>[],
      );

      final balance = state.maybeWhen(
        loading: (view) => view?.balance ?? Balance(),
        updated: (view) => view.balance,
        silentUpdated: (view) => view.balance,
        orElse: () => Balance(),
      );

      final countTransactions = state.maybeWhen(
        loading: (view) => view?.countTransactions ?? TransactionsGetCount(firstPage: 0, lastPage: 49),
        updated: (view) => view.countTransactions,
        silentUpdated: (view) => view.countTransactions,
        orElse: () => TransactionsGetCount(firstPage: 0, lastPage: 49),
      );

      emit(Loading(view: TransactionsView(currentPeriod: _currentPeriod, transactions: previousTransactions, balance: balance, countTransactions: countTransactions, hasReachedMax: false)));

      final transactions = await transactionsService.getAllTransactions(countTransactions);

      final pageSize = countTransactions.lastPage - countTransactions.firstPage + 1;
      final reachedMax = transactions.length < pageSize;

      emit(Updated(TransactionsView(currentPeriod: _currentPeriod, transactions: transactions, balance: balance, countTransactions: countTransactions, hasReachedMax: reachedMax)));
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }

  Future<void> onGetTransactionsByCategory(GetTransactionsByCategoryEvent e, Emitter emit) async {
    try {
      _currentCategoryId = e.categoryId;
      _isCategoryView = true;

        final balance = state.maybeWhen(
            loading: (view) => view?.balance ?? Balance(),
            updated: (view) => view.balance,
            orElse: () => Balance(),
          );

        final countTransactions = state.maybeWhen(
            loading: (view) => view?.countTransactions ?? TransactionsGetCount(firstPage: 0, lastPage: 49),
            updated: (view) => view.countTransactions,
            orElse: () => TransactionsGetCount(firstPage: 0, lastPage: 49),
          );

      emit(Loading(view: TransactionsView(currentPeriod: _currentPeriod, balance: balance, countTransactions: countTransactions, hasReachedMax: false)));

      final transactions = await transactionsService.getTransactionsByCategory(
        e.categoryId, 
        period: e.period.isEmpty ? null : e.period,
        count: countTransactions,
      );
      final pageSize = countTransactions.lastPage - countTransactions.firstPage + 1;
      final reachedMax = transactions.length < pageSize;

      emit(Updated(TransactionsView(currentPeriod: _currentPeriod, transactions: transactions, balance: balance, countTransactions: countTransactions, hasReachedMax: reachedMax)));
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }

  Future<void> onGetTransactionsByType(GetTransactionsByTypeEvent e, Emitter emit) async {
    try {
      final previousTransactions = state.maybeWhen(
        loading: (view) => (txs: view?.transactions ?? <Transaction>[]),
        updated:(view) => (txs: view.transactions),
        silentUpdated: (view) => (txs: view.transactions),
        orElse: () => (txs: <Transaction>[]),
      );

      final balance = state.maybeWhen(
        loading: (view) => view?.balance ?? Balance(),
        updated: (view) => view.balance,
        silentUpdated: (view) => view.balance,
        orElse: () => Balance(),
      );

      final countTransactions = state.maybeWhen(
        loading: (view) => view?.countTransactions ?? TransactionsGetCount(firstPage: 0, lastPage: 49),
        updated: (view) => view.countTransactions,
        orElse: () => TransactionsGetCount(firstPage: 0, lastPage: 49),
      );

      emit(Loading(view: TransactionsView(balance: balance, transactions: previousTransactions.txs, countTransactions: countTransactions, hasReachedMax: false)));
      final transactions = await transactionsService.getTransactionsByType(e.type, count: countTransactions);
      final pageSize = countTransactions.lastPage - countTransactions.firstPage + 1;
      final reachedMax = transactions.length < pageSize;

      emit(Updated(TransactionsView(balance: balance, transactions: transactions, countTransactions: countTransactions, hasReachedMax: reachedMax)));
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }

  Future<void> onGetTransactionsByTypeSilent(GetTransactionsByTypeSilentEvent e, Emitter emit) async {
    try {
      final countTransactions = e.count ?? TransactionsGetCount(firstPage: 0, lastPage: 49);

      final previousTransactions = state.maybeWhen(
        loading: (view) => view?.transactions ?? <Transaction>[],
        updated: (view) => view.transactions,
        silentUpdated: (view) => view.transactions,
        orElse: () => <Transaction>[],
      );

      final balance = state.maybeWhen(
        loading: (view) => view?.balance ?? Balance(),
        updated: (view) => view.balance,
        silentUpdated: (view) => view.balance,
        orElse: () => Balance(),
      );

      emit(Loading(view: TransactionsView(balance: balance, transactions: previousTransactions, countTransactions: countTransactions, hasReachedMax: false)));

      final transactions = await transactionsService.getTransactionsByType(e.type, period: e.period, count: countTransactions);

      final pageSize = countTransactions.lastPage - countTransactions.firstPage + 1;
      final reachedMax = transactions.length < pageSize;

      emit(TransactionsState.silentUpdated(TransactionsView(balance: balance, transactions: transactions, countTransactions: countTransactions, hasReachedMax: reachedMax, currentPeriod: e.period)));
    } catch (ex) {
      emit(Error(error: ex.toString()));
    }
  }

  Future<void> onSaveTransaction(SaveTransactionEvent e, Emitter emit) async {
    try {
      final currentBalance = state.maybeMap(
        updated: (s) => s.view.balance,
        loading: (s) => s.view?.balance ?? Balance(),
        orElse: () => Balance(),
      );

      final countTransactions = state.maybeWhen(
        loading: (view) => view?.countTransactions ?? TransactionsGetCount(firstPage: 0, lastPage: 49),
        updated: (view) => view.countTransactions,
        orElse: () => TransactionsGetCount(firstPage: 0, lastPage: 49),
      );

      emit(Loading(view: TransactionsView(currentPeriod: _currentPeriod, balance: currentBalance, countTransactions: countTransactions, hasReachedMax: false)));
      await transactionsService.addTransaction(e.transaction);
      
      List<Transaction> transactions;
      if (_isCategoryView && _currentCategoryId != null) {
        transactions = await transactionsService.getTransactionsByCategory(
          _currentCategoryId!,
          period: _currentPeriod.isEmpty ? null : _currentPeriod,
          count: countTransactions,
        );
      } else {
        transactions = await transactionsService.getTransactionsByPeriod(_currentPeriod, countTransactions);
      }

      final balance = await transactionsService.getTotalBalance();
      final countTransactionsAfter = state.maybeWhen(
        loading: (view) => view?.countTransactions ?? TransactionsGetCount(firstPage: 0, lastPage: 49),
        updated: (view) => view.countTransactions,
        orElse: () => TransactionsGetCount(firstPage: 0, lastPage: 49),
      );
      final pageSize = countTransactionsAfter.lastPage - countTransactionsAfter.firstPage + 1;
      final reachedMax = transactions.length < pageSize;

      emit(Updated(TransactionsView(currentPeriod: _currentPeriod, transactions: transactions, balance: balance, countTransactions: countTransactionsAfter, hasReachedMax: reachedMax)));
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }

  Future<void> onLoadMoreTransactions(LoadMoreTransactionsEvent e, Emitter emit) async {
    final currentState = state.mapOrNull(updated: (value) => value);
    if (currentState == null) return;
    final oldLastPage = currentState.view.countTransactions.lastPage;
    final newFirstPage = oldLastPage + 1;
    final newLastPage = newFirstPage + 49;

    final newCount = TransactionsGetCount(firstPage: newFirstPage, lastPage: newLastPage);

    try {
      List<Transaction> newTransactions = [];
      
      if (_isCategoryView && _currentCategoryId != null) {
      } else if (_currentPeriod.isNotEmpty) {
        newTransactions = await transactionsService.getTransactionsByPeriod(_currentPeriod, newCount);
      } else {
        newTransactions = await transactionsService.getAllTransactions(newCount);
      }

        if (newTransactions.isEmpty) {
          emit(Updated(TransactionsView(currentPeriod: _currentPeriod, transactions: currentState.view.transactions, balance: currentState.view.balance, countTransactions: currentState.view.countTransactions, hasReachedMax: true)));
          return;
        }

      final allTransactions = [...(currentState.view.transactions ?? <Transaction>[]), ...newTransactions];

      final pageSize = newCount.lastPage - newCount.firstPage + 1;
      final reachedMax = newTransactions.length < pageSize;

      emit(Updated(
        TransactionsView(
          currentPeriod: _currentPeriod,
          transactions: allTransactions,
          balance: currentState.view.balance,
          countTransactions: newCount,
          hasReachedMax: reachedMax,
        ),
      ));

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

      const initialCount = TransactionsGetCount(firstPage: 0, lastPage: 49);

      final previous = state.maybeWhen(
        loading: (view) => TransactionsView(
          currentPeriod: view?.currentPeriod,
          transactions: view?.transactions ?? <Transaction>[],
          balance: view?.balance ?? Balance(),
          countTransactions: view?.countTransactions ?? initialCount,
          hasReachedMax: view?.hasReachedMax ?? false,
        ),
        updated: (view) => view,
        silentUpdated: (view) => view,
        orElse: () => TransactionsView(transactions: <Transaction>[], balance: Balance(), countTransactions: initialCount),
      );

      emit(Loading(view: TransactionsView(
        currentPeriod: _currentPeriod,
        transactions: previous.transactions,
        balance: previous.balance,
        countTransactions: initialCount,
        hasReachedMax: false,
      )));

      final transactions = await transactionsService.getTransactionsByPeriod(_currentPeriod, initialCount);
      final balance = await transactionsService.getTotalBalance();

      emit(Updated(TransactionsView(transactions: transactions, currentPeriod: _currentPeriod, balance: balance, countTransactions: initialCount, hasReachedMax: false)));
    } catch (e) {
      emit(Error(error: e.toString()));
    }
  }
}
