import 'package:equatable/equatable.dart';
import 'package:story_app_flutter/core/common/story_entity.dart';

class StoryResponseEntity extends Equatable {
  final bool error;
  final String message;
  final StoryEntity story;

  const StoryResponseEntity(this.error, this.message, this.story);

  @override
  List<Object?> get props => [
        error,
        message,
        story,
      ];
}
