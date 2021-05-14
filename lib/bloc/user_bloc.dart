import 'package:e_commerce/exports/all_exports.dart';
import 'package:rxdart/rxdart.dart';

class UserListBloc {
  // Initialization of repository class
  UserRepository _userRepository = UserRepository();

  // Stream declaration
  BehaviorSubject<UserResponse> _subject = BehaviorSubject<UserResponse>();

  // Declaration of a method for access getUser repository
  getUsers() async {
    UserResponse response = await _userRepository.getUsers();
    Future.delayed(Duration(seconds: 2)).then((value) {
      _subject.sink.add(response);
    });
  }

  // Declaration of method that dispose the stream
  dispose() {
    _subject.close();
  }

  // Declaration of an accessor for accessing the controller
  // From outside the class
  BehaviorSubject<UserResponse> get subject => _subject;
}

final userListBloc = UserListBloc();
