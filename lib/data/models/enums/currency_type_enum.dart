import 'package:json_annotation/json_annotation.dart';

enum Currency {
  @JsonValue('USD') usd,
  @JsonValue('EURO') euro,
}
