import 'package:e_commerce/exports/all_exports.dart';

class Routes {
  Routes._();

  static const String login = '/login_page';
  static const String home = '/home_page';
  static const String signup = '/sign_up_page';
  static const String search = '/search_page';

  static final routes = <String, WidgetBuilder>{
    login: (BuildContext context) => LoginPage(),
    home: (BuildContext context) => HomePage(),
    signup: (BuildContext context) => SignupPage(),
    search: (BuildContext context) => SearchPage(),
  };
}
