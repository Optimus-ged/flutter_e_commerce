import 'package:e_commerce/exports/all_exports.dart';
import 'package:rxdart/rxdart.dart';

class SignUpBloc {
  BehaviorSubject<UserResponse> _subject = BehaviorSubject<UserResponse>();
  BehaviorSubject<UserResponse> get stream => _subject.stream;

  signUp(Users user) async {
    String _token = await locator.get<SharedPreferencesHelper>().authToken;
    UserResponse response =
        await locator.get<Provider>().signUp(_token, user);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

}
