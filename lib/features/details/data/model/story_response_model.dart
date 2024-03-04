import 'package:story_app_flutter/core/common/story_model.dart';
import 'package:story_app_flutter/features/details/domain/entity/story_response_entity.dart';

class StoryResponseModel extends StoryResponseEntity {
  const StoryResponseModel(super.error, super.message, super.story);

  factory StoryResponseModel.fromJson(Map<String, dynamic> json) =>
      StoryResponseModel(
        json["error"],
        json["message"],
        StoryModel.fromJson(json["story"]),
      );
}
