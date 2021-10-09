import 'dart:io';

import 'package:e_commerce/ngango_lib/model/all_agents_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class AjoutAgentEvent extends Equatable {
  const AjoutAgentEvent();

  @override
  List<Object> get props => [];
}

class AjoutAgentButtonPressed extends AjoutAgentEvent {
  final CreateAgent agentData;
  final File file;

  const AjoutAgentButtonPressed(
      {@required this.agentData, @required this.file});

  @override
  List<Object> get props => [agentData, file];
}

class Test extends AjoutAgentEvent {}
