import 'package:e_commerce/bloc/enterprise/get_enterprise/get_all_enterprise_bloc.dart';
import 'package:e_commerce/bloc/enterprise/get_enterprise/get_all_enterprise_event.dart';
import 'package:e_commerce/bloc/enterprise/get_enterprise/get_all_enterprise_state.dart';
import 'package:e_commerce/model/models_index.dart';
import 'package:e_commerce/views/pages/pages_index.dart';
import 'package:e_commerce/views/shared/enterprise_item.dart';
import 'package:e_commerce/views/shared/shared_index.dart';
import 'package:timezone/data/latest.dart' as tz;


class Principal extends StatefulWidget {
  final Contribuable contribuable;
  const Principal({Key key, @required this.contribuable}) : super(key: key);

  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  int currentTap = 0;
  GetAllEnterpriseBloc _getAllEnterpriseBloc;
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen;
  

  @override
  void initState() {
    BlocProvider.of<GetAllEnterpriseBloc>(context)
      ..add(LoadEnterprises(userId: widget.contribuable.id));

    tz.initializeTimeZones();
    
    currentScreen = HomePage(
      contribuable: widget.contribuable,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GetAllEnterpriseBloc, GetAllEnterpriseState>(
      bloc: _getAllEnterpriseBloc,
      listener: (context, state) {
        if (state is GetAllEnterpriseSuccess) {
          GlobalData.entreprises.clear();
          state.enterpriseData.entreprises.forEach((e) {
            GlobalData.entreprises.add(EnterpriseItem(enterprise: e));
          });
        }
      },
      child: Scaffold(
        body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Container(
            height: 60,
            padding: EdgeInsets.only(top: 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
                    // color: Colors.red,
                    // width: MediaQuery.of(context).size.width * .50,
                    child: MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = HomePage(
                            contribuable: widget.contribuable,
                          );
                          currentTap = 0;
                        });
                      },
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Icon(
                            Icons.home_outlined,
                            color:
                                currentTap == 0 ? Color(0xffAA000A) : Colors.grey,
                          ),
                          Text(
                            'Accueil',
                            style: TextStyle(
                              color: currentTap == 0
                                  ? Color(0xffAA000A)
                                  : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // width: MediaQuery.of(context).size.width * .50,
                    // color: Colors.green,
                    child: MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = EnterprisePage(
                            contribuable: widget.contribuable,
                          );
                          currentTap = 1;
                        });
                      },
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Icon(
                            Icons.countertops_outlined,
                            color:
                                currentTap == 1 ? Color(0xffAA000A) : Colors.grey,
                          ),
                          Text(
                            'Entrepri..',
                            style: TextStyle(
                              color: currentTap == 1
                                  ? Color(0xffAA000A)
                                  : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    // width: MediaQuery.of(context).size.width * .50,
                    // color: Colors.red,
                    child: MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = NotificationPage();
                          currentTap = 3;
                        });
                      },
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Icon(
                            Icons.notifications,
                            color:
                                currentTap == 3 ? Color(0xffAA000A) : Colors.grey,
                          ),
                          Text(
                            'Notifs',
                            style: TextStyle(
                              color: currentTap == 3
                                  ? Color(0xffAA000A)
                                  : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: MaterialButton(
                      minWidth: 40,
                      onPressed: () {
                        setState(() {
                          currentScreen = ProfilePage(
                            contribuable: widget.contribuable,
                          );
                          currentTap = 2;
                        });
                      },
                      child: Column(
                        children: [
                          SizedBox(height: 10),
                          Icon(
                            Icons.face,
                            color:
                                currentTap == 2 ? Color(0xffAA000A) : Colors.grey,
                          ),
                          Text(
                            'Profile',
                            style: TextStyle(
                              color: currentTap == 2
                                  ? Color(0xffAA000A)
                                  : Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
