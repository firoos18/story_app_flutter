// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterResponseEntityImpl _$$RegisterResponseEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterResponseEntityImpl(
      error: json['error'] as bool?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$RegisterResponseEntityImplToJson(
        _$RegisterResponseEntityImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
    };
