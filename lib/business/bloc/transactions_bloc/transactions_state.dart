part of 'transactions_bloc.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState.initial() = _Initial;
  const factory TransactionsState.loading({String? currentPeriod}) = Loading;
  const factory TransactionsState.updated(List<Transaction> transactions, {String? currentPeriod}) = Updated;
  const factory TransactionsState.error({required String error}) = Error;
}
