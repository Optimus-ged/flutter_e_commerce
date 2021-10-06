import 'package:bloc/bloc.dart';
import 'package:e_commerce/bloc/all_paiements_bloc/get_all_pyt_events.dart';
import 'package:e_commerce/bloc/user_identity_bloc/user_identity_event.dart';
import 'package:e_commerce/bloc/user_identity_bloc/user_identity_state.dart';
import 'package:e_commerce/data/repository/provider.dart';
import 'package:e_commerce/model/paiement/get_all_paiement.dart';
import 'package:e_commerce/model/user_model/user_response.dart';
import 'package:e_commerce/utils/setup_locator.dart';

import 'get_all_pyt_state.dart';

class GetAllPaiementsBloc extends Bloc<GetAllPaiementsEvent, GetAllPaimentsState> {
  get _api => locator.get<Provider>();
  GetAllPaiementsBloc() : super(GetAllPaimentsInitial());

  @override
  Stream<GetAllPaimentsState> mapEventToState(GetAllPaiementsEvent event) async* {
    if (event is LoadAllPaiements)
      yield* _mapGetAllPaiementsButtonPressedToState(event);
  }

  Stream<GetAllPaimentsState> _mapGetAllPaiementsButtonPressedToState(
      LoadAllPaiements event) async* {
    try {
      yield GetAllPaimentsInProgress();
      AllPaiementsResponse getAllPaiements = await _api.getOneUser(event.userId);
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
