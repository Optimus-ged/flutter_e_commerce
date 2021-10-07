import 'package:bloc/bloc.dart';
import 'package:e_commerce/optimus_lib/bloc/all_paiements_bloc/get_all_pyt_events.dart';
import 'package:e_commerce/optimus_lib/data/repository/provider.dart';
import 'package:e_commerce/optimus_lib/model/paiement/get_all_paiement.dart';
import 'package:e_commerce/optimus_lib/utils/setup_locator.dart';
import 'get_all_pyt_state.dart';

class GetAllPaiementsBloc
    extends Bloc<GetAllPaiementsEvent, GetAllPaimentsState> {
  get _api => locator.get<Provider>();
  GetAllPaiementsBloc() : super(GetAllPaimentsInitial());

  @override
  Stream<GetAllPaimentsState> mapEventToState(
      GetAllPaiementsEvent event) async* {
    if (event is LoadAllPaiements)
      yield* _mapGetAllPaiementsButtonPressedToState(event);
  }

  Stream<GetAllPaimentsState> _mapGetAllPaiementsButtonPressedToState(
      LoadAllPaiements event) async* {
    try {
      yield GetAllPaimentsInProgress();
      AllPaiementsResponse getAllPaiements = await _api.getAllPaiements();
      if (getAllPaiements.status == 200) {
        yield GetAllPaimentsSuccess(allPaiementsResponse: getAllPaiements);
      } else {
        yield GetAllPaimentsFailure(message: 'echec');
        return;
      }
    } catch (error, stackTrace) {
      yield GetAllPaimentsFailure(message: '$error');
      print(
        'GetAllPaiementsBloc.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace',
      );
      return;
    }
  }
}
