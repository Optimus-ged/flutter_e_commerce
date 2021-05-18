import 'package:e_commerce/exports/all_exports.dart';
import 'package:rxdart/rxdart.dart';

class UserListBloc {
  UserRepository _repository = UserRepository();
  BehaviorSubject<UserResponse> _subject = BehaviorSubject<UserResponse>();

  // Get all users
  getUsers(String token) async {
    UserResponse response = await _repository.getUsers(token);
    Future.delayed(Duration(seconds: 2)).then((value) {
      _subject.sink.add(response);
    });
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<UserResponse> get subject => _subject;
}

final userListBloc = UserListBloc();
