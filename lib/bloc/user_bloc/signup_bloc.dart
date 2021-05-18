import 'package:dio/dio.dart';
import 'package:e_commerce/exports/all_exports.dart';
import 'package:rxdart/rxdart.dart';

class SignUpBloc {
  UserRepository _repository = UserRepository();
  BehaviorSubject<UserResponse> _subject = BehaviorSubject<UserResponse>();

  signUp(String token, Users user) async {
    UserResponse response = await _repository.signUp(token, user);
    _subject.sink.add(response);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<UserResponse> get subject => _subject;
}

final signUpBloc = SignUpBloc();
