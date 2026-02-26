// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Balance _$BalanceFromJson(Map<String, dynamic> json) => _Balance(
  totalBalance: (json['totalBalance'] as num?)?.toDouble() ?? 0.0,
  expense: (json['expense'] as num?)?.toDouble() ?? 0.0,
  income: (json['income'] as num?)?.toDouble() ?? 0.0,
);

Map<String, dynamic> _$BalanceToJson(_Balance instance) => <String, dynamic>{
  'totalBalance': instance.totalBalance,
  'expense': instance.expense,
  'income': instance.income,
};
