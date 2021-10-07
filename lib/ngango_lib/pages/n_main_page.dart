import 'package:e_commerce/ngango_lib/pages/n_agent_page.dart';
import 'package:e_commerce/ngango_lib/pages/n_client_page.dart';
import 'package:e_commerce/ngango_lib/pages/n_paiement_page.dart';
import 'package:e_commerce/ngango_lib/pages/n_reservation_page.dart';
import 'package:flutter/material.dart';

class NMainPage extends StatefulWidget {
  const NMainPage({Key key}) : super(key: key);

  @override
  _NMainPageState createState() => _NMainPageState();
}

class _NMainPageState extends State<NMainPage> {
  int currentTap = 0;

  final List<Widget> screens = [
    NAgentPage(),
    NClientPage(),
    NReservationPage(),
    NPaiementPage()
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = NAgentPage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){},
        ),
    );
    
  }
}
