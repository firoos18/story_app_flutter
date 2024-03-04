import 'package:either_dart/either.dart';
import 'package:story_app_flutter/core/failures/failures.dart';
import 'package:story_app_flutter/features/authentication/data/model/login_model.dart';
import 'package:story_app_flutter/features/authentication/data/model/register_model.dart';
import 'package:story_app_flutter/features/authentication/domain/entity/login_response_entity.dart';
import 'package:story_app_flutter/features/authentication/domain/entity/register_response_entity.dart';

abstract class AuthenticationRepository {
  Future<Either<Failures, LoginResponseEntity>?> userLogin(
      LoginModel? loginModel);

  Future<Either<Failures, RegisterResponseEntity>?> userRegister(
      RegisterModel? registerModel);

  Future<Either<Failures, String>> saveUserToken(String? userToken);

  Either<Failures, String> retrieveUserToken();
}
