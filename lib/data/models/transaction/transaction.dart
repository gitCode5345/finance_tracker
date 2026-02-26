import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:finance_tracker/data/models/category/category.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
abstract class Transaction with _$Transaction {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Transaction({
    String? id,
    required String title,
    required double amount,
    required DateTime date,
    required String type,
    required String categoryId,
    Category? category,
    String? userId,
    String? note,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
}
