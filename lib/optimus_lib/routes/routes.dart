// import 'package:e_commerce/exports/all_exports.dart';


// import 'package:e_commerce/screens/pages/intro_page.dart';
// import 'package:e_commerce/screens/pages/login_page.dart';
// import 'package:flutter/material.dart';

// import 'routes_constants.dart';


import 'package:e_commerce/optimus_lib/exports/all_exports.dart';
import 'package:e_commerce/optimus_lib/routes/routes_constants.dart';
import 'package:e_commerce/optimus_lib/screens/pages/article_edit_page.dart';
import 'package:e_commerce/optimus_lib/screens/pages/details_page.dart';
import 'package:e_commerce/optimus_lib/screens/pages/home_page.dart';
import 'package:e_commerce/optimus_lib/screens/pages/intro_page.dart';
import 'package:e_commerce/optimus_lib/screens/pages/login_page.dart';
import 'package:e_commerce/optimus_lib/screens/pages/profile_page.dart';

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
      case Profile:
        return MaterialPageRoute(
            builder: (context) => ProfilePage(
                  settings.arguments,
                ));
        break;
      case EditArticle:
        return MaterialPageRoute(
            builder: (context) => EditArticlePage(
                  art: settings.arguments,
                ));
        break;
      // case Payment:
      //   return MaterialPageRoute(
      //     builder: (context) => PaymentPage(),
      //   );
      //   break;
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
