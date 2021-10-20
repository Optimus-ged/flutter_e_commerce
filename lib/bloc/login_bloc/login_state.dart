import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:e_commerce/model/models_index.dart';

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
