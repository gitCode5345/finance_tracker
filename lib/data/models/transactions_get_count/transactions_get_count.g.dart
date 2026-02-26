// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transactions_get_count.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionsGetCount _$TransactionsGetCountFromJson(
  Map<String, dynamic> json,
) => _TransactionsGetCount(
  firstPage: (json['first_page'] as num).toInt(),
  lastPage: (json['last_page'] as num).toInt(),
);

Map<String, dynamic> _$TransactionsGetCountToJson(
  _TransactionsGetCount instance,
) => <String, dynamic>{
  'first_page': instance.firstPage,
  'last_page': instance.lastPage,
};
