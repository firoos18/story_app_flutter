import 'package:story_app_flutter/features/authentication/domain/entity/login_result_entity.dart';

class LoginResultModel extends LoginResultEntity {
  const LoginResultModel({
    required super.name,
    required super.token,
    required super.userId,
  });

  factory LoginResultModel.fromJson(Map<String, dynamic> json) =>
      LoginResultModel(
        name: json['name'],
        token: json['token'],
        userId: json['userId'],
      );
}
