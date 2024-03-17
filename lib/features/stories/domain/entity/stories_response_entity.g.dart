// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stories_response_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoriesResponseEntityImpl _$$StoriesResponseEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$StoriesResponseEntityImpl(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      listStory: (json['listStory'] as List<dynamic>?)
          ?.map((e) => StoryEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StoriesResponseEntityImplToJson(
        _$StoriesResponseEntityImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'listStory': instance.listStory,
    };
