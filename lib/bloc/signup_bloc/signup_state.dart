import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:e_commerce/model/models_index.dart';

@immutable
abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object> get props => [];
}

class SignupInitial extends SignupState {}

class SignupInProgress extends SignupState {}

class SignupFailure extends SignupState {
  final String message;

  const SignupFailure({@required this.message});

  @override
  List<Object> get props => [message];
}

class SignupSuccess extends SignupState {
  final SignupResponse signupData;

  const SignupSuccess({@required this.signupData});

  @override
  List<Object> get props => [signupData];
}
