import 'package:freezed_annotation/freezed_annotation.dart';

part 'transactions_get_count.freezed.dart';
part 'transactions_get_count.g.dart';

@freezed
abstract class TransactionsGetCount with _$TransactionsGetCount {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory TransactionsGetCount({
    required int firstPage,
    required int lastPage
  }) = _TransactionsGetCount;

  factory TransactionsGetCount.fromJson(Map<String, dynamic> json) =>_$TransactionsGetCountFromJson(json);
}
