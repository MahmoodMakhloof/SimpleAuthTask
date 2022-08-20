import 'package:shared_preferences/shared_preferences.dart';

const String PREF_KEY_USER_NAME = "PREF_KEY_USER_NAME";
const String PREF_KEY_TOKEN = "PREF_KEY_TOKEN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  //* User Name Prefs
  String? getUserName()  {
    return _sharedPreferences.getString(PREF_KEY_USER_NAME);
  }

  setUserName(String userName)  {
    _sharedPreferences.setString(PREF_KEY_USER_NAME, userName);
  }

   clearUserName()  {
    _sharedPreferences.remove(PREF_KEY_USER_NAME);
  }

  //* Token Prefs
  Future<String?> getToken() async {
    return _sharedPreferences.getString(PREF_KEY_TOKEN);
  }

   setToken(String token)  {
    _sharedPreferences.setString(PREF_KEY_TOKEN, token);
  }

   clearToken()  {
    _sharedPreferences.remove(PREF_KEY_TOKEN);
  }
}
