import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:story_app_flutter/core/exceptions/exceptions.dart';
import 'package:story_app_flutter/core/failures/failures.dart';
import 'package:story_app_flutter/features/authentication/data/datasources/local/authentication_local_datasource.dart';
import 'package:story_app_flutter/features/authentication/data/datasources/remote/authentication_api_service.dart';
import 'package:story_app_flutter/features/authentication/data/model/login_model.dart';
import 'package:story_app_flutter/features/authentication/data/model/register_model.dart';
import 'package:story_app_flutter/features/authentication/domain/entity/login_response_entity.dart';
import 'package:story_app_flutter/features/authentication/domain/entity/register_response_entity.dart';
import 'package:story_app_flutter/features/authentication/domain/repository/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationApiService _authenticationApiService;
  final AuthenticationLocalDatasource _authenticationLocalDatasource;

  const AuthenticationRepositoryImpl(
    this._authenticationApiService,
    this._authenticationLocalDatasource,
  );

  @override
  Future<Either<Failures, LoginResponseEntity>?> userLogin(
      LoginModel? loginModel) async {
    if (loginModel != null) {
      try {
        final result = await _authenticationApiService.userLogin(loginModel);
        saveUserToken(result.loginResult!.token);
        return Right(result);
      } on RequestErrorException catch (e) {
        return Left(RequestFailure(e.message));
      } on SocketException {
        return Left(RequestFailure('Check your internet connection!'));
      }
    } else {
      return null;
    }
  }

  @override
  Future<Either<Failures, RegisterResponseEntity>?> userRegister(
      RegisterModel? registerModel) async {
    if (registerModel != null) {
      try {
        final result =
            await _authenticationApiService.userRegister(registerModel);
        return Right(result);
      } on RequestErrorException catch (e) {
        return Left(RequestFailure(e.message));
      } on SocketException {
        return Left(RequestFailure('Check your internet connection!'));
      }
    } else {
      return null;
    }
  }

  @override
  Future<Either<Failures, String>> saveUserToken(String? userToken) async {
    if (userToken != null) {
      await _authenticationLocalDatasource.setUserToken(userToken);
      return const Right("Successful");
    } else {
      return Left(RequestFailure("An Unknown Error Occured!"));
    }
  }

  @override
  Either<Failures, String> retrieveUserToken() {
    final data = _authenticationLocalDatasource.getUserToken();

    if (data != null) {
      return Right(data);
    } else {
      return Left(RequestFailure("User Not Logged In"));
    }
  }
}
