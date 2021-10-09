import 'package:e_commerce/ngango_lib/data/n_provider.dart';
import 'package:e_commerce/ngango_lib/model/all_clients_model.dart';
import 'package:rxdart/rxdart.dart';

class ListClientsBloc {
  final _subject = BehaviorSubject<ClientsModel>();
  get stream => _subject.stream;

  // Get data function
  getClients() async {
    final _response = await myProvider.getAllClients();
    _subject.sink.add(_response);
  }

  dispose() {
    _subject.close();
  }
}

final listeClientsBloc = ListClientsBloc();
