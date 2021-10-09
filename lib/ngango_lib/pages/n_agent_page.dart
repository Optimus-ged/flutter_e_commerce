import 'package:e_commerce/ngango_lib/bloc/agent_bloc/agents_bloc.dart';
import 'package:e_commerce/ngango_lib/model/all_agents_model.dart';
import 'package:e_commerce/ngango_lib/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';

class NAgentPage extends StatefulWidget {
  const NAgentPage({Key key}) : super(key: key);

  @override
  _NAgentPageState createState() => _NAgentPageState();
}

class _NAgentPageState extends State<NAgentPage> {
  @override
  void initState() {
    listeAgentsBloc.getAgents();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            MyAppbar(title: 'TOUS LES AGENTS'),
            StreamBuilder<AllAgents>(
              stream: listeAgentsBloc.stream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                      padding: EdgeInsets.all(0),
                      itemCount: snapshot.data.agents.length,
                      itemBuilder: (context, index) {
                        final agent = snapshot.data.agents[index];
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
                                        'http://192.168.137.1:3535/images/${agent.photo}', fit: BoxFit.cover,),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('${agent.nom}'),
                                      Text('${agent.telephone}')
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  );
                }
                return Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
