import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:story_app_flutter/core/exceptions/exceptions.dart';
import 'package:story_app_flutter/core/failures/failures.dart';
import 'package:story_app_flutter/features/add_story/data/datasource/add_story_remote_datasource.dart';
import 'package:story_app_flutter/features/add_story/domain/entity/add_story_entity.dart';
import 'package:story_app_flutter/features/add_story/domain/entity/add_story_response_entity.dart';
import 'package:story_app_flutter/features/add_story/domain/repository/add_story_repository.dart';

class AddStoryRepositoryImpl implements AddStoryRepository {
  final AddStoryRemoteDatasource addStoryRemoteDatasource;

  const AddStoryRepositoryImpl(this.addStoryRemoteDatasource);

  @override
  Future<Either<Failures, AddStoryResponseEntity>> postStory(
      AddStoryEntity addStoryEntity) async {
    try {
      final List<int> bytes = await addStoryEntity.photo.readAsBytes();

      final response = await addStoryRemoteDatasource.addStory(
          bytes, "photo", addStoryEntity.description);

      return Right(response);
    } on RequestErrorException catch (e) {
      return Left(RequestFailure(e.message));
    } on SocketException {
      return Left(RequestFailure("Check Your Internet Connection!"));
    }
  }
}
