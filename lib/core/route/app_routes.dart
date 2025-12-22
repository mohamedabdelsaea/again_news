import 'package:again_news/core/route/page_route_name.dart';
import 'package:again_news/modules/home/home_screen.dart';
import 'package:again_news/modules/home/search/search_screen.dart';
import 'package:again_news/modules/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case PageRouteName.initial:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
      case PageRouteName.home:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case PageRouteName.search:
        return MaterialPageRoute(
          builder: (context) => SearchScreen(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) => SplashScreen(),
        );
    }
  }
}
