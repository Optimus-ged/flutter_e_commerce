import 'package:e_commerce/exports/all_exports.dart';

class SharedPreferencesHelper {
  static SharedPreferences _sPrefs;
  static SharedPreferencesHelper _insance;

  static Future<SharedPreferencesHelper> getInstance() async {
    if (_insance == null) {
      _insance = SharedPreferencesHelper();
    }
    if (_sPrefs == null) {
      _sPrefs = await SharedPreferences.getInstance();
    }

    return _insance;
  }

  Future<void> saveAuthToken(String authToken) async {
    return _sPrefs.setString("token", "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJub20iOiJPcHRpbXVzIHlhbGEiLCJpZCI6NCwiaWF0IjoxNjIxNzA1NDY2LCJleHAiOjE2MjE5NjQ2NjZ9.lzJ5ogGXEkLbkZVZIyUqfSwZbuePqJLy0a-JMq8Xk2k");
  }

  Future<String> get authToken async {
    return _sPrefs.getString("token");
  }

  Future<void> get clearItems async {
    return _sPrefs.clear();
  }

  Future<void> get removeAuth async {
    return _sPrefs.remove("token");
  }
}
