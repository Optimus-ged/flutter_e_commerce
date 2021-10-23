import 'package:e_commerce/views/shared/shared_index.dart';
import 'routes/routes.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ));
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes.materialRoutes,
        theme: ThemeData(
          primarySwatch: Colors.grey,
          fontFamily: '${CustomTheme.secondaryFont}'),
        home: IntroPage(),
      ),
    );
  }
}