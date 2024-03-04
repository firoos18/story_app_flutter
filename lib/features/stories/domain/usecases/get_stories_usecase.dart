import 'package:either_dart/either.dart';
import 'package:story_app_flutter/core/failures/failures.dart';
import 'package:story_app_flutter/core/usecase/usecase.dart';
import 'package:story_app_flutter/features/stories/domain/entity/stories_response_entity.dart';
import 'package:story_app_flutter/features/stories/domain/repository/story_repository.dart';

class GetStoriesUsecase
    implements UseCase<Either<Failures, StoriesResponseEntity>, Null> {
  final StoryRepository storyRepository;

  const GetStoriesUsecase(this.storyRepository);

  @override
  Future<Either<Failures, StoriesResponseEntity>> call({Null params}) async {
    return await storyRepository.getStories();
  }
}
