import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app_flutter/features/authentication/domain/entity/login_result_entity.dart';

part 'login_response_entity.freezed.dart';
part 'login_response_entity.g.dart';

@freezed
class LoginResponseEntity with _$LoginResponseEntity {
  const factory LoginResponseEntity({
    bool? error,
    LoginResultEntity? loginResult,
    String? message,
  }) = _LoginResponseEntity;

  factory LoginResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseEntityFromJson(json);
}
