// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_result_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginResultEntityImpl _$$LoginResultEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$LoginResultEntityImpl(
      name: json['name'] as String?,
      token: json['token'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$$LoginResultEntityImplToJson(
        _$LoginResultEntityImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'token': instance.token,
      'userId': instance.userId,
    };
