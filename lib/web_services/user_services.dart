import 'package:flutter/foundation.dart';

class Userr with ChangeNotifier {
  String _username = 'ged';
  String get username => _username;
  set username(String username) {
    _username = username;
    notifyListeners();
  }
}