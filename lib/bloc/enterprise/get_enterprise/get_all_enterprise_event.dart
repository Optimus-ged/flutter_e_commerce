import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class GetAllEnterpriseEvent extends Equatable {
  const GetAllEnterpriseEvent();

  @override
  List<Object> get props => [];
}

class LoadEnterprises extends GetAllEnterpriseEvent {
  final String userId;

  const LoadEnterprises({@required this.userId})
      : assert(userId != null);

  @override
  List<Object> get props => [userId];
}
