import 'package:either_dart/either.dart';
import 'package:story_app_flutter/core/failures/failures.dart';
import 'package:story_app_flutter/features/authentication/data/model/login_model.dart';
import 'package:story_app_flutter/features/authentication/domain/entity/login_response_entity.dart';
import 'package:story_app_flutter/features/authentication/domain/repository/authentication_repository.dart';
import 'package:story_app_flutter/core/usecase/usecase.dart';

class UserLoginUsecase
    implements UseCase<Either<Failures, LoginResponseEntity>?, LoginModel> {
  final AuthenticationRepository authenticationRepository;

  const UserLoginUsecase(this.authenticationRepository);

  @override
  Future<Either<Failures, LoginResponseEntity>?> call(
      {LoginModel? params}) async {
    return await authenticationRepository.userLogin(params);
  }
}
