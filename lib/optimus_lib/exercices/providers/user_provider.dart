import 'package:e_commerce/optimus_lib/exports/all_exports.dart';
import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  User _user = User();
  get user => _user;

  set setUser(User user) {
    _user = user;
    notifyListeners();
  }
}

class UserTest with ChangeNotifier {
  String _username = '';
  get username => _username;
  set username(String username) {
    _username = username;
    notifyListeners();
  }
}
