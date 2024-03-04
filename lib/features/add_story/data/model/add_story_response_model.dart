import 'dart:convert';

import 'package:story_app_flutter/features/add_story/domain/entity/add_story_response_entity.dart';

class AddStoryResponseModel extends AddStoryResponseEntity {
  const AddStoryResponseModel(super.error, super.message);

  factory AddStoryResponseModel.fromMap(Map<String, dynamic> json) =>
      AddStoryResponseModel(
        json["error"],
        json["message"],
      );

  factory AddStoryResponseModel.fromJson(String source) =>
      AddStoryResponseModel.fromMap(jsonDecode(source));
}
