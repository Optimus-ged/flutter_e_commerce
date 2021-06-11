import 'package:e_commerce/exports/all_exports.dart';

class SharedPreferencesHelper {
  SharedPreferences _sPrefs;
  SharedPreferencesHelper _insance;

   Future<SharedPreferencesHelper> getInstance() async {
    if (_insance == null) {
      _insance = SharedPreferencesHelper();
    }
    if (_sPrefs == null) {
      _sPrefs = await SharedPreferences.getInstance();
    }

    return _insance;
  }

  Future<void> saveAuthToken(String authToken) async {
    return _sPrefs.setString("token", authToken);
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
