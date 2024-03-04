import 'package:story_app_flutter/features/authentication/domain/entity/register_response_entity.dart';

class RegisterResponseModel extends RegisterResponseEntity {
  const RegisterResponseModel({
    required super.error,
    required super.message,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      RegisterResponseModel(
        error: json['error'],
        message: json['message'],
      );
}
