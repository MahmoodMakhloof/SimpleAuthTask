import 'package:shared_preferences/shared_preferences.dart';

const String PREF_KEY_USER_NAME = "PREF_KEY_USER_NAME";
const String PREF_KEY_TOKEN = "PREF_KEY_TOKEN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  //* User Name Prefs
  Future<String?> getUserName() async {
    return _sharedPreferences.getString(PREF_KEY_USER_NAME);
  }

  Future<void> setUserName(String userName) async {
    _sharedPreferences.setString(PREF_KEY_USER_NAME, userName);
  }

  Future<void> clearUserName() async {
    _sharedPreferences.remove(PREF_KEY_USER_NAME);
  }

  //* Token Prefs
  Future<String?> getToken() async {
    return _sharedPreferences.getString(PREF_KEY_TOKEN);
  }

  Future<void> setToken(String token) async {
    _sharedPreferences.setString(PREF_KEY_TOKEN, token);
  }

  Future<void> clearToken() async {
    _sharedPreferences.remove(PREF_KEY_TOKEN);
  }
}
