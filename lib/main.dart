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


