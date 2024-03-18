import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterModel {
  final String email;
  final String name;
  final String password;

  const RegisterModel({
    required this.email,
    required this.name,
    required this.password,
  });

  Map<String, dynamic> toJson() => _$RegisterModelToJson(this);
}
