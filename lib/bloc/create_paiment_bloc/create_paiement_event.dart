import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/model/paiement/create_paiement.dart';
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
