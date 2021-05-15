import 'package:e_commerce/exports/all_exports.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(
    <DeviceOrientation>[
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown
    ],
  ).then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppTheme.blueColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: AppTheme.blueColor,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: AppTheme.fontName,
        platform: TargetPlatform.iOS,
      ),
      routes: Routes.routes,
      home: LoginPage(),
    );
  }
}

class UserInterface extends StatefulWidget {
  @override
  _UserInterfaceState createState() => _UserInterfaceState();
}

class _UserInterfaceState extends State<UserInterface> {
  @override
  void initState() {
    userListBloc..getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserResponse>(
      stream: userListBloc.subject.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data;
          if (snapshot.error != null) {
            return Container(
              color: Colors.green.withOpacity(0.3),
              child: Text(
                "Error",
                style: TextStyle(fontSize: 30, color: Colors.amber),
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: Text("${data.users[0].nom}"),
            ),
            body: ListView.builder(
              itemBuilder: (context, index) => ListTile(
                leading: Icon(Icons.face),
                title: Text("${data.users[index].nom}"),
                subtitle: Text("${data.users[index].contact}"),
              ),
              itemCount: snapshot.data.users.length,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                userListBloc..getUsers();
              },
            ),
          );
        } else if (snapshot.hasError) {
          return Container(
            color: Colors.green.withOpacity(0.3),
            child: Text(
              "Error",
              style: TextStyle(fontSize: 30, color: Colors.amber),
            ),
          );
        } else {
          return Material(
            child: Container(
              color: Colors.black54,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}

// To remove the glow on the whole application, you can add it right under MaterialApp :
// MaterialApp(
//   builder: (context, child) {
//     return ScrollConfiguration(
//       behavior: MyBehavior(),
//       child: child,
//     );
//   },
//   home: new RemoveGlow(),
// );


