import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/model/user_model/signup_response.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupInProgress extends SignupState {}

class SignupFailure extends SignupState {
  final SignUpResponse data;

  const SignupFailure({@required this.data});

  @override
  List<Object> get props => [data];
}

class SignupSuccess extends SignupState {
  final SignUpResponse data;

  const SignupSuccess({@required this.data});

  @override
  List<Object> get props => [data];
}
