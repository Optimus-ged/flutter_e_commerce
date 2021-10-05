import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/model/paiement/create_paiement.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class CreatePaiemenrEvent extends Equatable {
  const CreatePaiemenrEvent();

  @override
  List<Object> get props => [];
}

class CreatePaiemenrButtonPressed extends CreatePaiemenrEvent {
  final CreatePaiement paiementData;

  const CreatePaiemenrButtonPressed({@required this.paiementData});

  @override
  List<Object> get props => [paiementData];
}
