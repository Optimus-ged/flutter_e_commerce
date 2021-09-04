
import 'package:e_commerce/exports/all_exports.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  const LoginButtonPressed(
      {@required this.email, @required this.password})
      : assert(email != null),
        assert(password != null);

  @override
  List<Object> get props => [email, password];
}


