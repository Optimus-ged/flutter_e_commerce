import 'package:e_commerce/ngango_lib/pages/n_login.dart';
import 'package:e_commerce/optimus_lib/routes/routes.dart';
import 'exports/all_exports.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness:
          Platform.isAndroid ? Brightness.dark : Brightness.light,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Flutter UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        dividerTheme: DividerThemeData(space: 0),
      ),
      onGenerateRoute: Routes.materialRoutes,
      home: Nloginn(),
    );
  }
}
