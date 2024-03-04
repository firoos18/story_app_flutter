import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:story_app_flutter/core/exceptions/exceptions.dart';
import 'package:story_app_flutter/core/failures/failures.dart';
import 'package:story_app_flutter/features/details/data/datasource/story_details_remote_datasource.dart';
import 'package:story_app_flutter/features/details/domain/repository/story_details_repository.dart';
import 'package:story_app_flutter/features/details/domain/entity/story_response_entity.dart';

class StoryDetailsRepositoryImpl implements StoryDetailsRepository {
  final StoryDetailsRemoteDatasource storyDetailsRemoteDatasource;

  const StoryDetailsRepositoryImpl(this.storyDetailsRemoteDatasource);

  @override
  Future<Either<Failures, StoryResponseEntity>> getStoryDetails(
      String id) async {
    try {
      final data = await storyDetailsRemoteDatasource.getStoryDetails(id);
      print(data);
      return Right(data);
    } on RequestErrorException catch (e) {
      return Left(RequestFailure(e.message));
    } on SocketException {
      return Left(RequestFailure("Check Your Internet Connection!"));
    }
  }
}
