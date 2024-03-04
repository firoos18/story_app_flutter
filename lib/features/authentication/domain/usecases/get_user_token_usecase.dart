import 'package:either_dart/either.dart';
import 'package:story_app_flutter/core/failures/failures.dart';
import 'package:story_app_flutter/core/usecase/usecase.dart';
import 'package:story_app_flutter/features/authentication/domain/repository/authentication_repository.dart';

class GetUserTokenUsecase implements UseCase<Either<Failures, String>, Null> {
  final AuthenticationRepository authenticationRepository;

  const GetUserTokenUsecase(this.authenticationRepository);

  @override
  Future<Either<Failures, String>> call({Null params}) async {
    return authenticationRepository.retrieveUserToken();
  }
}
