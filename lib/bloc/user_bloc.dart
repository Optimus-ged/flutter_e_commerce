import 'package:e_commerce/exports/all_exports.dart';
import 'package:rxdart/rxdart.dart';

class UserListBloc {
  UserRepository _repository = UserRepository();
  BehaviorSubject<UserResponse> _subject = BehaviorSubject<UserResponse>();
  
  getUsers() async {
    UserResponse response = await _repository.getUsers();
    Future.delayed(Duration(seconds: 5)).then(
      (value) => _subject.sink.add(response),
    );
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<UserResponse> get subject => _subject;
}

final userListBloc = UserListBloc();
