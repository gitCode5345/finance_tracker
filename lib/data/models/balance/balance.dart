import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:finance_tracker/data/models/enums/currency_type_enum.dart';

part 'balance.freezed.dart';
part 'balance.g.dart';

@freezed
abstract class Balance with _$Balance {
  const factory Balance({
    int? id,
    required double balance,
    required Currency currency,
    required int userId,
  }) = _Balance;

  factory Balance.fromJson(Map<String, dynamic> json) => _$BalanceFromJson(json);
}