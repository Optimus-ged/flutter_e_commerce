import 'package:bloc/bloc.dart';
import 'package:e_commerce/ngango_lib/bloc/ajout_agent_bloc/n_ajout_agent_event.dart';
import 'package:e_commerce/ngango_lib/bloc/ajout_agent_bloc/n_ajout_agent_state.dart';
import 'package:e_commerce/ngango_lib/data/n_provider.dart';
import 'package:e_commerce/optimus_lib/exports/all_exports.dart';

class AjoutAgentBloc extends Bloc<AjoutAgentEvent, AjoutAgentState> {
  AjoutAgentBloc() : super(AjoutAgentInitial());

  @override
  Stream<AjoutAgentState> mapEventToState(AjoutAgentEvent event) async* {
    if (event is AjoutAgentButtonPressed)
      yield* _mapAjoutAgentButtonPressedToState(event);
  }

  Stream<AjoutAgentState> _mapAjoutAgentButtonPressedToState(
      AjoutAgentButtonPressed event) async* {
    try {
      yield AjoutAgentInProgress();
      final login = await myProvider.postAgent(
        file: event.file,
        agentData: event.agentData,
      );
      if (login.status == true) {
        yield AjoutAgentSuccess(agentData: login);
      } else {
        yield AjoutAgentFailure(message: 'Agent ajoute avec success');
        return;
      }
    } catch (error, stackTrace) {
      yield AjoutAgentFailure(message: "$error");
      print(
          'AjoutAgentBloc.MapEventToState ::: ERROR: $error, STACKTRACE: $stackTrace');
      return;
    }
  }
}
