import 'package:either_dart/either.dart';
import 'package:story_app_flutter/core/failures/failures.dart';
import 'package:story_app_flutter/core/usecase/usecase.dart';
import 'package:story_app_flutter/features/add_story/domain/entity/add_story_entity.dart';
import 'package:story_app_flutter/features/add_story/domain/entity/add_story_response_entity.dart';
import 'package:story_app_flutter/features/add_story/domain/repository/add_story_repository.dart';

class AddStoryUsecase
    implements
        UseCase<Either<Failures, AddStoryResponseEntity>, AddStoryEntity> {
  final AddStoryRepository addStoryRepository;

  const AddStoryUsecase(this.addStoryRepository);

  @override
  Future<Either<Failures, AddStoryResponseEntity>> call(
      {AddStoryEntity? params}) async {
    return await addStoryRepository.postStory(params!);
  }
}
