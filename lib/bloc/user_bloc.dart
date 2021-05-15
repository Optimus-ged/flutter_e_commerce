import 'package:e_commerce/exports/all_exports.dart';
import 'package:rxdart/rxdart.dart';

class UserListBloc {
  UserRepository _userRepository = UserRepository();
  BehaviorSubject<UserResponse> _subject = BehaviorSubject<UserResponse>();

  // Declaration of a method for access getUser repository
  getUsers() async {
    UserResponse response = await _userRepository.getUsers();
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
