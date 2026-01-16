part of 'transactions_bloc.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState.initial() = _Initial;
  const factory TransactionsState.loading() = Loading;
  const factory TransactionsState.updated({required List<Transaction> transactions}) = Updated;
  const factory TransactionsState.error({required String error}) = Error;
}
