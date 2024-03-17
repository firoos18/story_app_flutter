import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app_flutter/core/common/story_entity.dart';

part 'stories_response_entity.freezed.dart';
part 'stories_response_entity.g.dart';

@freezed
class StoriesResponseEntity with _$StoriesResponseEntity {
  const factory StoriesResponseEntity(
      {bool? error,
      String? message,
      List<StoryEntity>? listStory}) = _StoriesResponseEntity;

  factory StoriesResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$StoriesResponseEntityFromJson(json);
}
