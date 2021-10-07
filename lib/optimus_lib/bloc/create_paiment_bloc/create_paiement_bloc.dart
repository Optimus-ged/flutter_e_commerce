import 'package:bloc/bloc.dart';
import 'package:e_commerce/optimus_lib/bloc/create_paiment_bloc/create_paiement_event.dart';
import 'create_paiement_state.dart';
import 'package:e_commerce/optimus_lib/exports/all_exports.dart';

class CreatePaiementBloc
    extends Bloc<CreatePaiementEvent, CreatePaiementState> {
  get _api => locator.get<Provider>();
  CreatePaiementBloc() : super(CreatePaiementInitial());

  @override
  Stream<CreatePaiementState> mapEventToState(
      CreatePaiementEvent event) async* {
    if (event is CreatePaiementButtonPressed)
      yield* _mapCreatePaiementButtonPressedToState(event);
  }

  Stream<CreatePaiementState> _mapCreatePaiementButtonPressedToState(
      CreatePaiementButtonPressed event) async* {
    try {
      yield CreatePaiementInProgress();
      final paiement = await _api.createPaiement(event.paiementData);
      if (paiement.status == 200) {
        yield CreatePaiementSuccess(paiementResponse: paiement);
      } else {
        yield CreatePaiementFailure(message: 'paiement non effectue');
        return;
      }
    } catch (error, stackTrace) {
      yield CreatePaiementFailure(message: "$error");
      print(
          'CreatePaiementBloc.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace');
      return;
    }
  }
}
