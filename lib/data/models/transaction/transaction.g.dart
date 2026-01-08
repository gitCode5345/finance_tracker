// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Transaction _$TransactionFromJson(Map<String, dynamic> json) => _Transaction(
  id: json['id'] as String?,
  amount: (json['amount'] as num).toDouble(),
  date: json['date'] as String,
  type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
  categoryId: json['category_id'] as String,
  userId: json['user_id'] as String?,
  note: json['note'] as String?,
);

Map<String, dynamic> _$TransactionToJson(_Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'date': instance.date,
      'type': _$TransactionTypeEnumMap[instance.type]!,
      'category_id': instance.categoryId,
      'user_id': instance.userId,
      'note': instance.note,
    };

const _$TransactionTypeEnumMap = {
  TransactionType.income: 'income',
  TransactionType.expense: 'expense',
};
