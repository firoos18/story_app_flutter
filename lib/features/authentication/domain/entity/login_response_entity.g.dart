// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResponseEntityImpl _$$LoginResponseEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginResponseEntityImpl(
      error: json['error'] as bool?,
      loginResult: json['loginResult'] == null
          ? null
          : LoginResultEntity.fromJson(
              json['loginResult'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$LoginResponseEntityImplToJson(
        _$LoginResponseEntityImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'loginResult': instance.loginResult?.toJson(),
      'message': instance.message,
    };
