part of 'transactions_bloc.dart';

@freezed
class TransactionsState with _$TransactionsState {
  const factory TransactionsState.initial() = _Initial;
  const factory TransactionsState.loading({
    TransactionsView? view,
  }) = Loading;
  const factory TransactionsState.updated(
    TransactionsView view,
  ) = Updated;
  const factory TransactionsState.silentUpdated(
    TransactionsView view,
  ) = SilentUpdated;
  const factory TransactionsState.error({required String error}) = Error;
}
