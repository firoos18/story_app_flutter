import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app_flutter/core/constants/constants.dart';
import 'package:story_app_flutter/core/exceptions/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:story_app_flutter/features/details/domain/entity/story_response_entity.dart';

class StoryDetailsRemoteDatasource {
  final SharedPreferences _prefs;

  const StoryDetailsRemoteDatasource(this._prefs);

  Future<StoryResponseEntity> getStoryDetails(String id) async {
    final token = _prefs.getString("token");

    final response = await http.get(Uri.parse("$baseUrl/stories/$id"),
        headers: {"Authorization": "Bearer $token"});

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return StoryResponseEntity.fromJson(data);
    } else {
      final data = jsonDecode(response.body);
      throw RequestErrorException(data['message']);
    }
  }
}
