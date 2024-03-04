import 'package:story_app_flutter/core/common/story_model.dart';
import 'package:story_app_flutter/features/stories/domain/entity/stories_response_entity.dart';

class StoriesResponseModel extends StoriesResponseEntity {
  const StoriesResponseModel(super.error, super.message, super.listStory);

  factory StoriesResponseModel.fromJson(Map<String, dynamic> json) =>
      StoriesResponseModel(
        json["error"],
        json["message"],
        List<StoryModel>.from(
          (json["listStory"] as List<dynamic>).map(
            (story) => StoryModel.fromJson(story as Map<String, dynamic>),
          ),
        ),
      );
}
