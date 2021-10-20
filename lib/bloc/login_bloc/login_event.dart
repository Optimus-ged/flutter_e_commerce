import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:e_commerce/model/models_index.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class LoginButtonPressed extends LoginEvent {
  final LoginSubmit submitData;

  const LoginButtonPressed({@required this.submitData})
      : assert(submitData != null);

  @override
  List<Object> get props => [submitData];
}
