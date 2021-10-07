// import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/optimus_lib/data/repository/provider.dart';
import 'package:e_commerce/optimus_lib/model/user_model/user_response.dart';
import 'package:e_commerce/optimus_lib/utils/preferences_helper.dart';
import 'package:e_commerce/optimus_lib/utils/setup_locator.dart';
import 'package:rxdart/rxdart.dart';

class UserListBloc {
  BehaviorSubject<UserResponse> _subject = BehaviorSubject<UserResponse>();
  BehaviorSubject<UserResponse> get stream => _subject.stream;

  // Get all users
  getUsers() async {
    String _token = await locator.get<SharedPreferencesHelper>().authToken;
    UserResponse response = await locator.get<Provider>().getUsers(_token);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }
}
