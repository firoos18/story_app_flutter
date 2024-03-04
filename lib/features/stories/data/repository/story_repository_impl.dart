import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:story_app_flutter/core/exceptions/exceptions.dart';
import 'package:story_app_flutter/core/failures/failures.dart';
import 'package:story_app_flutter/features/stories/data/datasource/story_remote_datasource.dart';
import 'package:story_app_flutter/features/stories/data/model/stories_response_model.dart';
import 'package:story_app_flutter/features/stories/domain/repository/story_repository.dart';

class StoryRepositoryImpl implements StoryRepository {
  final StoryRemoteDatasource _storyRemoteDatasource;

  const StoryRepositoryImpl(this._storyRemoteDatasource);

  @override
  Future<Either<Failures, StoriesResponseModel>> getStories() async {
    try {
      final data = await _storyRemoteDatasource.getStories();
      return Right(data);
    } on RequestErrorException catch (e) {
      return Left(RequestFailure(e.message));
    } on SocketException {
      return Left(RequestFailure("Check Your Internet Connection!"));
    }
  }
}
