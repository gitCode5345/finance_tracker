import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:finance_tracker/data/models/enums/transaction_type_enum.dart';

part 'transaction.freezed.dart';
part 'transaction.g.dart';

@freezed
abstract class Transaction with _$Transaction {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Transaction({
    String? id,
    required double amount,
    required DateTime createdAt,
    required TransactionType type,
    required String categoryId,
    String? userId,
    String? note,
  }) = _Transaction;

  factory Transaction.fromJson(Map<String, dynamic> json) => _$TransactionFromJson(json);
}
