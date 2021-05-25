import 'package:e_commerce/exports/all_exports.dart';

abstract class Routes {
  static const String intro = '/';
  static const String login = '/login_page';
  static const String home = '/home_page';
  static const String signup = '/sign_up_page';
  static const String search = '/search_page';
  static const String details = '/details_page';

  static MaterialPageRoute materialRoutes(RouteSettings settings) {
    switch (settings.name) {
      case intro:
        return MaterialPageRoute(builder: (context) => IntroPage());
        break;
      case login:
        return MaterialPageRoute(builder: (context) => LoginPage());
        break;
      case home:
        return MaterialPageRoute(builder: (context) => HomePage());
        break;
      case signup:
        return MaterialPageRoute(builder: (context) => SignupPage());
        break;
      case search:
        return MaterialPageRoute(builder: (context) => SearchPage());
        break;
      case details:
        return MaterialPageRoute(builder: (context) => DetailPage());
        break;
      default:
        return MaterialPageRoute(builder: (context) => LoginPage());
        break;
    }
  }
}
