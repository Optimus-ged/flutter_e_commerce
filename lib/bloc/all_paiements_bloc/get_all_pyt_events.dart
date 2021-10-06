import 'package:e_commerce/exports/all_exports.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class GetAllPaiementsEvent extends Equatable {
  const GetAllPaiementsEvent();

  @override
  List<Object> get props => [];
}

class LoadAllPaiements extends GetAllPaiementsEvent {}
