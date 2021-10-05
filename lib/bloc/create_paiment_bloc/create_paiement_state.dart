import 'package:e_commerce/exports/all_exports.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class CreatePaiementState extends Equatable {
  const CreatePaiementState();

  @override
  List<Object> get props => [];
}

class CreatePaiementInitial extends CreatePaiementState {}

class CreatePaiementInProgress extends CreatePaiementState {}

class CreatePaiementFailure extends CreatePaiementState {
  final String message;

  const CreatePaiementFailure({@required this.message});

  @override
  List<Object> get props => [message];
}

class CreatePaiementSuccess extends CreatePaiementState {
  final LoginResponse paiementResponse;

  const CreatePaiementSuccess({@required this.paiementResponse});

  @override
  List<Object> get props => [paiementResponse];
}
