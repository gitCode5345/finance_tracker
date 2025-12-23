// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Balance _$BalanceFromJson(Map<String, dynamic> json) => _Balance(
  id: (json['id'] as num?)?.toInt(),
  balance: (json['balance'] as num).toDouble(),
  currency: $enumDecode(_$CurrencyEnumMap, json['currency']),
  userId: (json['userId'] as num).toInt(),
);

Map<String, dynamic> _$BalanceToJson(_Balance instance) => <String, dynamic>{
  'id': instance.id,
  'balance': instance.balance,
  'currency': _$CurrencyEnumMap[instance.currency]!,
  'userId': instance.userId,
};

const _$CurrencyEnumMap = {Currency.usd: 'USD', Currency.euro: 'EURO'};
