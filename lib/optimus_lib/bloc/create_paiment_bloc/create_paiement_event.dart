import 'package:e_commerce/optimus_lib/exports/all_exports.dart';
import 'package:e_commerce/optimus_lib/model/paiement/create_paiement.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class CreatePaiementEvent extends Equatable {
  const CreatePaiementEvent();

  @override
  List<Object> get props => [];
}

class CreatePaiementButtonPressed extends CreatePaiementEvent {
  final CreatePaiement paiementData;

  const CreatePaiementButtonPressed({@required this.paiementData});

  @override
  List<Object> get props => [paiementData];
}
