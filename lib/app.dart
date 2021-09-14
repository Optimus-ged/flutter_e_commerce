import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/screens/pages/admin_homepage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppTheme.blueColor,
      statusBarIconBrightness: Brightness.light,
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
        fontFamily: AppTheme.fontName,
        platform: TargetPlatform.iOS,
      ),
      onGenerateRoute: Routes.materialRoutes,
      home: AdminHomepage(),
    );
  }
}
