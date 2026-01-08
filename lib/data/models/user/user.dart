import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
abstract class User with _$User {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory User({
    String? id,
    required String firstName,
    required String lastName,
    required String email,
    required String phone,
    required String dateOfBirth,
    required String password,
  }) = _User;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
