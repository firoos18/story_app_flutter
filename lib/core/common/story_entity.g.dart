// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StoryEntityImpl _$$StoryEntityImplFromJson(Map<String, dynamic> json) =>
    _$StoryEntityImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      photoUrl: json['photoUrl'] as String?,
      createdAt: json['createdAt'] as String?,
      lat: (json['lat'] as num?)?.toDouble(),
      lon: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$StoryEntityImplToJson(_$StoryEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt,
      'lat': instance.lat,
      'lon': instance.lon,
    };
