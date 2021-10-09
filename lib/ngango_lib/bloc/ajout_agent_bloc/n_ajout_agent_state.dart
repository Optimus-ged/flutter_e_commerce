import 'package:e_commerce/ngango_lib/model/all_agents_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AjoutAgentState extends Equatable {
  const AjoutAgentState();

  @override
  List<Object> get props => [];
}

class AjoutAgentInitial extends AjoutAgentState {}

class AjoutAgentInProgress extends AjoutAgentState {}

class AjoutAgentFailure extends AjoutAgentState {
  final String message;

  const AjoutAgentFailure({@required this.message});

  @override
  List<Object> get props => [message];
}

class AjoutAgentSuccess extends AjoutAgentState {
  final CreateAgentResponse agentData;

  const AjoutAgentSuccess({@required this.agentData});

  @override
  List<Object> get props => [agentData];
}
