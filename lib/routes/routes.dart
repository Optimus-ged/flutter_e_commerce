// import 'package:e_commerce/exports/all_exports.dart';

import 'package:e_commerce/exports/all_exports.dart';
import 'package:e_commerce/routes/routes_constants.dart';

// import 'package:e_commerce/screens/pages/intro_page.dart';
// import 'package:e_commerce/screens/pages/login_page.dart';
// import 'package:flutter/material.dart';

// import 'routes_constants.dart';

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
        return MaterialPageRoute(
          builder: (context) => HomePage(
            settings.arguments,
          ),
        );
        break;
      case Signup:
        return MaterialPageRoute(builder: (context) => SignupPage());
        break;
      case Search:
        return MaterialPageRoute(builder: (context) => SearchPage());
        break;
      case Payment:
        return MaterialPageRoute(
          builder: (context) => PaymentPage(),
        );
        break;
      case Details:
        return MaterialPageRoute(
          builder: (context) => DetailPage(
            data: settings.arguments,
          ),
        );
        break;
      default:
        return MaterialPageRoute(builder: (context) => LoginPage());
        break;
    }
  }
}
