import 'package:either_dart/either.dart';
import 'package:story_app_flutter/core/failures/failures.dart';
import 'package:story_app_flutter/features/stories/domain/entity/stories_response_entity.dart';

abstract class StoryRepository {
  Future<Either<Failures, StoriesResponseEntity>> getStories({
    final int page,
    final int size,
  });
}
