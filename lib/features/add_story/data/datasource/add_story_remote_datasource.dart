import 'dart:typed_data';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:story_app_flutter/core/constants/constants.dart';
import 'package:http/http.dart' as http;
import 'package:story_app_flutter/features/add_story/domain/entity/add_story_response_entity.dart';

class AddStoryRemoteDatasource {
  final SharedPreferences _prefs;

  const AddStoryRemoteDatasource(this._prefs);

  Future<AddStoryResponseEntity> addStory(
    List<int> bytes,
    String fileName,
    String description,
    double? lat,
    double? lon,
  ) async {
    final token = _prefs.getString("token");

    var request = http.MultipartRequest('POST', Uri.parse("$baseUrl/stories"));

    final Map<String, String> requestHeaders = {
      "Content-Type": "multipart/form-data",
      "Authorization": "Bearer $token"
    };
    request.headers.addAll(requestHeaders);

    final multiPartFile = http.MultipartFile.fromBytes(
      "photo",
      bytes,
      filename: fileName,
    );

    final Map<String, String> fields;

    if (lat != null && lon != null) {
      fields = {
        "description": description,
        "lat": lat.toString(),
        "lon": lon.toString(),
      };
    } else {
      fields = {
        "description": description,
      };
    }

    final Map<String, String> headers = {
      "Content-type": "multipart/form-data",
    };

    request.files.add(multiPartFile);
    request.fields.addAll(fields);
    request.headers.addAll(headers);

    final streamedResponse = await request.send();
    final int statusCode = streamedResponse.statusCode;

    final Uint8List responseList = await streamedResponse.stream.toBytes();
    final String responseData = String.fromCharCodes(responseList);

    if (statusCode == 201) {
      print(responseData);

      final AddStoryResponseEntity response = AddStoryResponseEntity.fromSource(
        responseData,
      );
      return response;
    } else {
      throw Exception("Upload file error");
    }
  }
}
