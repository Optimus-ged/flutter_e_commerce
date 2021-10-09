// import 'package:e_commerce/optimus_lib/exports/all_exports.dart';
import 'package:e_commerce/ngango_lib/model/login.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginInProgress extends LoginState {}

class LoginFailure extends LoginState {
  final String login;

  const LoginFailure({@required this.login});

  @override
  List<Object> get props => [login];
}

class LoginSuccess extends LoginState {
  final LoginResponse login;

  const LoginSuccess({@required this.login});

  @override
  List<Object> get props => [login];
}
