import 'package:either_dart/either.dart';
import 'package:story_app_flutter/core/failures/failures.dart';
import 'package:story_app_flutter/features/details/domain/entity/story_response_entity.dart';

abstract class StoryDetailsRepository {
  Future<Either<Failures, StoryResponseEntity>> getStoryDetails(String id);
}
