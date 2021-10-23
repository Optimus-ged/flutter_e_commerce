import 'package:e_commerce/model/enterprise/get_all_enterprises.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';
import 'package:e_commerce/model/models_index.dart';

@immutable
abstract class GetAllEnterpriseState extends Equatable {
  const GetAllEnterpriseState();

  @override
  List<Object> get props => [];
}

class GetAllEnterpriseInitial extends GetAllEnterpriseState {}

class GetAllEnterpriseInProgress extends GetAllEnterpriseState {}

class GetAllEnterpriseFailure extends GetAllEnterpriseState {
  final String enterpriseData;

  const GetAllEnterpriseFailure({@required this.enterpriseData});

  @override
  List<Object> get props => [enterpriseData];
}

class GetAllEnterpriseSuccess extends GetAllEnterpriseState {
  final GetAllEnterprisesResponse enterpriseData;

  const GetAllEnterpriseSuccess({@required this.enterpriseData});

  @override
  List<Object> get props => [enterpriseData];
}
