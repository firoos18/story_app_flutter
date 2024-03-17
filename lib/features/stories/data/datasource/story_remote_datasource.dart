import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app_flutter/core/exceptions/exceptions.dart';
import 'package:http/http.dart' as http;
import 'package:story_app_flutter/features/stories/domain/entity/stories_response_entity.dart';

class StoryRemoteDatasource {
  final SharedPreferences _prefs;

  const StoryRemoteDatasource(this._prefs);

  Future<StoriesResponseEntity> getStories({
    int? page,
    int? size,
  }) async {
    final token = _prefs.getString("token");

    final Map<String, String> queryParams = {
      "page": page.toString(),
      "size": size.toString(),
    };

    final Uri uri = Uri.https(
      "story-api.dicoding.dev",
      "v1/stories",
      queryParams,
    );
    final response = await http.get(
      uri,
      headers: {
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      final data = jsonDecode(response.body);
      return StoriesResponseEntity.fromJson(data);
    } else {
      final data = jsonDecode(response.body);
      throw RequestErrorException(data['message']);
    }
  }
}
