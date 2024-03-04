import 'package:either_dart/either.dart';
import 'package:story_app_flutter/core/failures/failures.dart';
import 'package:story_app_flutter/core/usecase/usecase.dart';
import 'package:story_app_flutter/features/details/domain/entity/story_response_entity.dart';
import 'package:story_app_flutter/features/details/domain/repository/story_details_repository.dart';

class GetStoryDetailsUsecase
    implements UseCase<Either<Failures, StoryResponseEntity>, String> {
  final StoryDetailsRepository storyDetailsRepository;

  const GetStoryDetailsUsecase(this.storyDetailsRepository);

  @override
  Future<Either<Failures, StoryResponseEntity>> call({String? params}) async {
    return await storyDetailsRepository.getStoryDetails(params!);
  }
}
