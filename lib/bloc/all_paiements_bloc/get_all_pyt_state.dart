import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/model/paiement/get_all_paiement.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class GetAllPaimentsState extends Equatable {
  const GetAllPaimentsState();

  @override
  List<Object> get props => [];
}

class GetAllPaimentsInitial extends GetAllPaimentsState {}

class GetAllPaimentsInProgress extends GetAllPaimentsState {}

class GetAllPaimentsFailure extends GetAllPaimentsState {
  final String message;

  const GetAllPaimentsFailure({@required this.message});

  @override
  List<Object> get props => [message];
}

class GetAllPaimentsSuccess extends GetAllPaimentsState {
  final AllPaiementsResponse allPaiementsResponse;

  const GetAllPaimentsSuccess({@required this.allPaiementsResponse});

  @override
  List<Object> get props => [allPaiementsResponse];
}
