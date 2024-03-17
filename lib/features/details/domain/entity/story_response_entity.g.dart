// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryResponseEntityImpl _$$StoryResponseEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$StoryResponseEntityImpl(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      story: json['story'] == null
          ? null
          : StoryEntity.fromJson(json['story'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$StoryResponseEntityImplToJson(
        _$StoryResponseEntityImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'story': instance.story,
    };
