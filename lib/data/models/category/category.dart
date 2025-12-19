import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:finance_tracker/data/models/enums/transaction_type_enum.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
abstract class Category with _$Category {
  const factory Category({
    int? id,
    required String name,
    required TransactionType type,
    required bool isSystem,
    int? userId,
    String? icon,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) => _$CategoryFromJson(json);
}
