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
      backgroundColor: Colors.white,
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        elevation: 0,
        notchMargin: 10,
        child: Container(
          height: 100,
          padding: EdgeInsets.only(top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = NAgentPage();
                        currentTap = 0;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentTap == 0 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Agents',
                          style: TextStyle(
                            color: currentTap == 0 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = NClientPage();
                        currentTap = 1;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentTap == 1 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Clients',
                          style: TextStyle(
                            color: currentTap == 1 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = NReservationPage();
                        currentTap = 2;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentTap == 2 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Agents',
                          style: TextStyle(
                            color: currentTap == 2 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = NPaiementPage();
                        currentTap = 3;
                      });
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.dashboard,
                          color: currentTap == 3 ? Colors.blue : Colors.grey,
                        ),
                        Text(
                          'Clients',
                          style: TextStyle(
                            color: currentTap == 3 ? Colors.blue : Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
