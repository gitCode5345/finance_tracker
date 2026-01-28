part of 'transactions_bloc.dart';

@freezed
class TransactionsEvent with _$TransactionsEvent {
  const factory TransactionsEvent.started() = _Started;
  const factory TransactionsEvent.getTransactions({required String period}) = GetTransactionsEvent;
  const factory TransactionsEvent.getTransactionsByCategory({required String categoryId, @Default('') String period}) = GetTransactionsByCategoryEvent;
  const factory TransactionsEvent.loadingTransactions() = LoadingTransactionsEvent;
  const factory TransactionsEvent.saveTransaction({required Transaction transaction}) = SaveTransactionEvent;
}
