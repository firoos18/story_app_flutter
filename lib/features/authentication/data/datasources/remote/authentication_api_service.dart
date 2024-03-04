import 'dart:convert';
import 'package:story_app_flutter/core/exceptions/exceptions.dart';
import 'package:story_app_flutter/features/authentication/data/model/login_model.dart';
import 'package:story_app_flutter/features/authentication/data/model/login_response_model.dart';
import 'package:story_app_flutter/features/authentication/data/model/register_model.dart';
import 'package:story_app_flutter/features/authentication/data/model/register_response_model.dart';
import 'package:story_app_flutter/core/constants/constants.dart';
import 'package:http/http.dart' as http;

class AuthenticationApiService {
  Future<LoginResponseModel> userLogin(LoginModel loginModel) async {
    final response = await http.post(
      Uri.parse("$baseUrl/login"),
      body: loginModel.toJson(),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return LoginResponseModel.fromJson(data);
    } else {
      final data = jsonDecode(response.body);
      throw RequestErrorException(data['message']);
    }
  }

  Future<RegisterResponseModel> userRegister(
      RegisterModel registerModel) async {
    final response = await http.post(
      Uri.parse("$baseUrl/register"),
      body: registerModel.toJson(),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return RegisterResponseModel.fromJson(data);
    } else {
      final data = jsonDecode(response.body);
      throw RequestErrorException(data['message']);
    }
  }
}
