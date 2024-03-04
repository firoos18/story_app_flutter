import 'package:equatable/equatable.dart';
import 'package:story_app_flutter/core/common/story_entity.dart';

class StoriesResponseEntity extends Equatable {
  final bool error;
  final String message;
  final List<StoryEntity> listStory;

  const StoriesResponseEntity(this.error, this.message, this.listStory);

  @override
  List<Object?> get props => [
        error,
        message,
        listStory,
      ];
}
