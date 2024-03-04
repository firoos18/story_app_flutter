import 'package:either_dart/either.dart';
import 'package:story_app_flutter/core/failures/failures.dart';
import 'package:story_app_flutter/features/authentication/data/model/register_model.dart';
import 'package:story_app_flutter/features/authentication/domain/entity/register_response_entity.dart';
import 'package:story_app_flutter/features/authentication/domain/repository/authentication_repository.dart';
import 'package:story_app_flutter/core/usecase/usecase.dart';

class UserRegisterUsecase
    implements
        UseCase<Either<Failures, RegisterResponseEntity>?, RegisterModel> {
  final AuthenticationRepository authenticationRepository;

  const UserRegisterUsecase(this.authenticationRepository);

  @override
  Future<Either<Failures, RegisterResponseEntity>?> call(
      {RegisterModel? params}) async {
    return await authenticationRepository.userRegister(params);
  }
}
