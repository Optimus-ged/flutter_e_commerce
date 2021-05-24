import 'package:e_commerce/exports/all_exports.dart';

class Routes {
  Routes._();

  static const String intro = '/';
  static const String login = '/login_page';
  static const String home = '/home_page';
  static const String signup = '/sign_up_page';
  static const String search = '/search_page';
  static const String details = '/details_page';

  static final routes = <String, WidgetBuilder>{
    intro: (BuildContext context) => IntroPage(),
    login: (BuildContext context) => LoginPage(),
    home: (BuildContext context) => HomePage(),
    signup: (BuildContext context) => SignupPage(),
    search: (BuildContext context) => SearchPage(),
    details : (BuildContext context) => DetailPage(),
  };
}
