import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_entity.freezed.dart';
part 'story_entity.g.dart';

@freezed
class StoryEntity with _$StoryEntity {
  const factory StoryEntity({
    String? id,
    String? name,
    String? description,
    String? photoUrl,
    String? createdAt,
    double? lat,
    double? lon,
  }) = _StoryEntity;

  factory StoryEntity.fromJson(Map<String, dynamic> json) =>
      _$StoryEntityFromJson(json);
}
