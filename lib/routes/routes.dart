import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/routes/routes_constants.dart';

abstract class Routes {
  static MaterialPageRoute materialRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Intro:
        return MaterialPageRoute(builder: (context) => IntroPage());
        break;
      case Login:
        return MaterialPageRoute(builder: (context) => LoginPage());
        break;
      case Home:
        return MaterialPageRoute(builder: (context) => HomePage());
        break;
      case Signup:
        return MaterialPageRoute(builder: (context) => SignupPage());
        break;
      case Search:
        return MaterialPageRoute(builder: (context) => SearchPage());
        break;
      case Details:
        return MaterialPageRoute(builder: (context) => DetailPage());
        break;
      default:
        return MaterialPageRoute(builder: (context) => LoginPage());
        break;
    }
  }
}
