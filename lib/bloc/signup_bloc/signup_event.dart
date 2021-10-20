import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:e_commerce/model/models_index.dart';

@immutable
abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object> get props => [];
}

class SignupButtonPressed extends SignupEvent {
  final SignupSubmit submitData;

  const SignupButtonPressed({@required this.submitData})
      : assert(submitData != null);

  @override
  List<Object> get props => [submitData];
}
