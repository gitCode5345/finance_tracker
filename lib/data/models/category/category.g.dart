// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Category _$CategoryFromJson(Map<String, dynamic> json) => _Category(
  id: json['id'] as String?,
  name: json['name'] as String,
  type: $enumDecode(_$TransactionTypeEnumMap, json['type']),
  isSystem: json['is_system'] as bool,
  userId: json['user_id'] as String?,
  icon: json['icon'] as String?,
);

Map<String, dynamic> _$CategoryToJson(_Category instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': _$TransactionTypeEnumMap[instance.type]!,
  'is_system': instance.isSystem,
  'user_id': instance.userId,
  'icon': instance.icon,
};

const _$TransactionTypeEnumMap = {
  TransactionType.income: 'income',
  TransactionType.expense: 'expense',
};
