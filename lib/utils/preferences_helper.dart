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

  Future<void> get saveAuthToken async {
    return _sPrefs.setString("token",
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJub20iOiJKb2huIEt1aGFuZGEiLCJpZCI6MywiaWF0IjoxNjIxMTAxMzk0LCJleHAiOjE2MjEzNjA1OTR9.l4t1tyBMgG7J1eQ4mK6rJPK-nHRJltQyt2oWi3RUmLw");
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
