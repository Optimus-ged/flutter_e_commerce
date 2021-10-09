import 'package:e_commerce/ngango_lib/bloc/client_bloc/clients_bloc.dart';
import 'package:e_commerce/ngango_lib/model/all_clients_model.dart';
import 'package:e_commerce/ngango_lib/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class NClientPage extends StatefulWidget {
  const NClientPage({Key key}) : super(key: key);

  @override
  _NClientPageState createState() => _NClientPageState();
}

class _NClientPageState extends State<NClientPage> {
  @override
  void initState() {
    listeClientsBloc.getClients();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<ClientsModel>(
        stream: listeClientsBloc.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Expanded(
              child: Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
            );
          } else {
            return Container(
              child: Column(
                children: [
                  MyAppbar(title: 'TOUS LES CLIENTS'),
                  Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: snapshot.data.clients.length,
                      itemBuilder: (context, index) {
                        final client = snapshot.data.clients[index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 5),
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            // color: Colors.green,
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(30),
                                  child: Container(
                                    height: 60,
                                    width: 60,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Color(0xffAA000A),
                                    ),
                                    child: Image.network(
                                      'http://192.168.137.1:3535/images/${client.photo}',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${client.nom.toUpperCase()} ${client.prenom.toUpperCase()}',
                                      ),
                                      Text('${client.telephone}')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
