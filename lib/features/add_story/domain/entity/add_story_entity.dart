import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_story_entity.freezed.dart';

@freezed
class AddStoryEntity with _$AddStoryEntity {
  const factory AddStoryEntity(
      {String? description,
      File? photo,
      double? lat,
      double? lon}) = _AddStoryEntity;
}
