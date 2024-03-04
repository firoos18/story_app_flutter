import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationLocalDatasource {
  final SharedPreferences _sharedPreferences;

  const AuthenticationLocalDatasource(this._sharedPreferences);

  Future<dynamic> setUserToken(String userToken) async {
    await _sharedPreferences.setString("token", userToken);
  }

  String? getUserToken() {
    final String? userToken = _sharedPreferences.getString("token");
    return userToken;
  }
}
