// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Balance _$BalanceFromJson(Map<String, dynamic> json) => _Balance(
  id: json['id'] as String?,
  balance: (json['balance'] as num).toDouble(),
  userId: json['user_id'] as String?,
);

Map<String, dynamic> _$BalanceToJson(_Balance instance) => <String, dynamic>{
  'id': instance.id,
  'balance': instance.balance,
  'user_id': instance.userId,
};
