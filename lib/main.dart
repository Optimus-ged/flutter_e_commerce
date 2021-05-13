import 'package:e_commerce/bloc/user_bloc.dart';
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
      home: UserInterface(),
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
        print("AAAAAAAAAAAAAAAAA");
        if (snapshot.hasData) {
          if (snapshot.error != null) {
            return Container(
              color: Colors.green.withOpacity(0.3),
              child: Text(
                "ERRRRRRRRRRROOOOOOOOOOOOOR",
                style: TextStyle(fontSize: 30, color: Colors.amber),
              ),
            );
          }

          return Scaffold(
            appBar: AppBar(
              title: Text("${snapshot.data.user[0].nom}"),
            ),
          );
        } else if (snapshot.hasError) {
          return Container(
            color: Colors.green.withOpacity(0.3),
            child: Text(
              "ERRRRRRRRRRROOOOOOOOOOOOOR",
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
                  Text("${snapshot.data}"),
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


