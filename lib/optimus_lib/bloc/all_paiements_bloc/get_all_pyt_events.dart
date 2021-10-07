
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class GetAllPaiementsEvent extends Equatable {
  const GetAllPaiementsEvent();

  @override
  List<Object> get props => [];
}

class LoadAllPaiements extends GetAllPaiementsEvent {}
