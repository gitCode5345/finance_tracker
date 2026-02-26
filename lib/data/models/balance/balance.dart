import 'package:freezed_annotation/freezed_annotation.dart';

part 'balance.freezed.dart';
part 'balance.g.dart';

@freezed
abstract class Balance with _$Balance {
  const factory Balance({
    @Default(0.0) double totalBalance,
    @Default(0.0) double expense,
    @Default(0.0) double income,
  }) = _Balance;

  factory Balance.fromJson(Map<String, dynamic> json) => _$BalanceFromJson(json);
}
