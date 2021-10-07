import 'package:e_commerce/ngango_lib/pages/n_loginn.dart';
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
      theme: ThemeData.dark().copyWith(
        
        platform: TargetPlatform.iOS,
        dividerTheme: DividerThemeData(space: 0),
      ),
      onGenerateRoute: Routes.materialRoutes,
      home: Nloginn(),
    );
    // return MaterialApp(
    //   title: 'Flutter UI',
    //   debugShowCheckedModeBanner: false,
    //   theme: ThemeData.dark(
    //     primarySwatch: Colors.blue,
    //     fontFamily: AppTheme.fontName,
    //     platform: TargetPlatform.iOS,
    //     dividerTheme: DividerThemeData(space: 0),
    //   ),
    //   onGenerateRoute: Routes.materialRoutes,
    //   home: Nloginn(),
    // );
  }
}
