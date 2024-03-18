import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_story_response_entity.freezed.dart';
part 'add_story_response_entity.g.dart';

@freezed
class AddStoryResponseEntity with _$AddStoryResponseEntity {
  const factory AddStoryResponseEntity({bool? error, String? message}) =
      _AddStoryResponseEntity;

  factory AddStoryResponseEntity.fromJson(Map<String, dynamic> json) =>
      _$AddStoryResponseEntityFromJson(json);

  factory AddStoryResponseEntity.fromSource(String source) =>
      AddStoryResponseEntity.fromJson(json.decode(source));
}
