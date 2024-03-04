import 'package:story_app_flutter/features/authentication/data/model/login_result_model.dart';
import 'package:story_app_flutter/features/authentication/domain/entity/login_response_entity.dart';

class LoginResponseModel extends LoginResponseEntity {
  const LoginResponseModel({
    required super.error,
    required super.loginResult,
    required super.message,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      LoginResponseModel(
        error: json['error'],
        message: json['message'],
        loginResult: LoginResultModel.fromJson(json['loginResult']),
      );
}
