import 'package:flutter/foundation.dart';
import 'package:e_commerce/data/repository/data_repository.dart';
import 'package:e_commerce/model/models_index.dart';
import 'package:e_commerce/utils/setup_locator.dart';

enum LoginState { Initial, Loading, Success, Error }

class LoginUser with ChangeNotifier {
  LoginState _loginState = LoginState.Initial;
  String message = '';
  Contribuable contribuable= Contribuable();
  bool isLoading = false;

  // Getters
  get loginState => _loginState;

  Future<void> loginUser({LoginSubmit submitData}) async {
    isLoading = true;
    _loginState = LoginState.Loading;

    try {
      LoginResponse login =
          await locator.get<DataRepository>().loginUser(submitData);
      if (login.status == 200) {
        contribuable = login.contribuable;
        isLoading = false;
        _loginState = LoginState.Success;
      } else {
        message = login.message;
        _loginState = LoginState.Error;
      }
    } catch (e) {
      isLoading = false;
      _loginState = LoginState.Error;
      message = '$e';
      print("ERROR loginUser : ${e.toString()}");
      throw e;
    }
    notifyListeners();
  }
}
