import 'package:flutter/material.dart';
import 'package:e_commerce/views/pages/pages_index.dart';
import 'package:e_commerce/routes/routes_constants.dart';

abstract class Routes {
  static MaterialPageRoute materialRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Login:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
        break;
      default:
        return MaterialPageRoute(
          builder: (context) => LoginPage(),
        );
        break;
    }
  }
}
