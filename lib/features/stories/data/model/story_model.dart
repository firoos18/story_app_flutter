import 'package:story_app_flutter/features/stories/domain/entity/story_entity.dart';

class StoryModel extends StoryEntity {
  const StoryModel(
    super.id,
    super.name,
    super.description,
    super.photoUrl,
    super.createdAt,
    super.lat,
    super.lon,
  );

  factory StoryModel.fromJson(Map<String, dynamic> json) => StoryModel(
        json["id"],
        json["name"],
        json["description"],
        json["photoUrl"],
        json["createdAt"],
        json["lat"] ?? 0,
        json["lon"] ?? 0,
      );
}
