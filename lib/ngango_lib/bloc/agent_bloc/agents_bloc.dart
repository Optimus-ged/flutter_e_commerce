import 'package:e_commerce/ngango_lib/data/n_provider.dart';
import 'package:e_commerce/ngango_lib/model/all_agents_model.dart';
import 'package:rxdart/rxdart.dart';

class ListeAgentsBloc {
  final _subject = BehaviorSubject<AllAgents>();
  get stream => _subject.stream;

  // Get data function
  getAgents() async {
    final _response = await myProvider.getAllAgents();
    _subject.sink.add(_response);
  }

  dispose() {
    _subject.close();
  }
}

final listeAgentsBloc = ListeAgentsBloc();
