import 'package:equatable/equatable.dart';
import 'package:story_app_flutter/features/authentication/domain/entity/login_result_entity.dart';

class LoginResponseEntity extends Equatable {
  final bool error;
  final String message;
  final LoginResultEntity loginResult;

  const LoginResponseEntity({
    required this.error,
    required this.loginResult,
    required this.message,
  });

  @override
  List<Object?> get props => [
        error,
        message,
        loginResult,
      ];
}
