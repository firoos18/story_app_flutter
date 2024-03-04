import 'package:either_dart/either.dart';
import 'package:story_app_flutter/core/failures/failures.dart';
import 'package:story_app_flutter/features/add_story/domain/entity/add_story_entity.dart';
import 'package:story_app_flutter/features/add_story/domain/entity/add_story_response_entity.dart';

abstract class AddStoryRepository {
  Future<Either<Failures, AddStoryResponseEntity>> postStory(
      AddStoryEntity addStoryEntity);
}
