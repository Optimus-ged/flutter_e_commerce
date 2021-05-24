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
    bool ok = true;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppTheme.blueColor,
      statusBarIconBrightness: Brightness.light,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarColor: AppTheme.whiteColor,
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
      home: ok ? LoginPage() : IntroPage(),
    );
  }
}

class UserInterface extends StatefulWidget {
  @override
  _UserInterfaceState createState() => _UserInterfaceState();
}

class _UserInterfaceState extends State<UserInterface> {
  // Future<SharedPreferences> _sPrefs = SharedPreferences.getInstance();
  String token;

  // Future<void> get saveAuthToken async {
  //   final SharedPreferences pref = await _sPrefs;
  //   return pref.setString("token",
  //       "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJub20iOiJKb2huIEt1aGFuZGEiLCJpZCI6MywiaWF0IjoxNjIxMTAxMzk0LCJleHAiOjE2MjEzNjA1OTR9.l4t1tyBMgG7J1eQ4mK6rJPK-nHRJltQyt2oWi3RUmLw");
  // }

  // Future<String> get authToken async {
  //   final SharedPreferences pref = await _sPrefs;
  //   return pref.getString("token");
  // }

  // Future<void> get clearItems async {
  //   final SharedPreferences prefs = await _sPrefs;
  //   return prefs.clear();
  // }

  // Future<void> get removeAuth async {
  //   final SharedPreferences pref = await _sPrefs;
  //   return pref.remove("token");
  // }

  @override
  void initState() {
    token =
        "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJub20iOiJPcHRpbXVzIHlhbGEiLCJpZCI6NCwiaWF0IjoxNjIxNzA1NDY2LCJleHAiOjE2MjE5NjQ2NjZ9.lzJ5ogGXEkLbkZVZIyUqfSwZbuePqJLy0a-JMq8Xk2k";
    userListBloc..getUsers(token);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<UserResponse>(
      stream: userListBloc.subject.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
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
              title: Text("${snapshot.data.users[0].nom}"),
            ),
            body: ListView.builder(
              physics: ClampingScrollPhysics(),
              itemBuilder: (context, index) => ListTile(
                leading: Image.network(
                    "http://192.168.137.1:3000/images/1621711633487_femme03.png"),
                title: Text("${snapshot.data.users[index].nom}"),
                subtitle: Text("${snapshot.data.users[index].contact}"),
              ),
              itemCount: snapshot.data.users.length,
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                userListBloc..getUsers(token);
              },
            ),
          );
        }
        return Material(
          child: Container(
            color: Colors.black,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
              ],
            ),
          ),
        );
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
