import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:story_app_flutter/core/common/story_entity.dart';

part 'story_response_entity.freezed.dart';
part 'story_response_entity.g.dart';

@freezed
class StoryResponseEntity with _$StoryResponseEntity {
  const factory StoryResponseEntity(
      {bool? error,
      String? message,
      StoryEntity? story}) = _StoryResponseEntity;

  factory StoryResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$StoryResponseEntityFromJson(json);
}
