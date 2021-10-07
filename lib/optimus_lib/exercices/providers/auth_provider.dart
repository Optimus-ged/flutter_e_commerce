import 'package:dio/dio.dart';
import 'package:e_commerce/optimus_lib/exports/all_exports.dart';
import 'package:flutter/material.dart';

enum Status {
  NotLogedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  LoggedOut
}

class AuthProvider extends ChangeNotifier {
  Dio _dio = Dio();
  Status _loggedInStatus = Status.NotLogedIn;
  Status _registeredInStatus = Status.NotRegistered;

  Status get loggedInStatus => _loggedInStatus;
  set loggedInStatus(Status value) {
    _loggedInStatus = value;
  }

  Status get registeredInStatus => _registeredInStatus;
  set registeredInStatus(Status value) {
    _registeredInStatus = value;
  }

  Future<LoginResponse> loginUser(String nom, String password) async {
    try {
      final result = await _dio.post(
        "http://192.168.137.1:3030/api/users/signin",
        data: {"nom": nom, "mot_de_passe": password},
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            "Accept": "application/json",
          },
        ),
      );
      return LoginResponse.fromJson(result.data);
    } catch (e) {
      print("ERROR loginUser : ${e.toString()}");
      throw e;
    }
  }
}
