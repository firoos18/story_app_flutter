import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response_entity.freezed.dart';
part 'register_response_entity.g.dart';

@freezed
class RegisterResponseEntity with _$RegisterResponseEntity {
  const factory RegisterResponseEntity({
    bool? error,
    String? message,
  }) = _RegisterResponseEntity;

  factory RegisterResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseEntityFromJson(json);
}
