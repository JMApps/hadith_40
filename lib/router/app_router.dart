import 'package:flutter/material.dart';
import 'package:hadith_40/pages/about_us.dart';
import 'package:hadith_40/pages/hadeeth_apart_content.dart';
import 'package:hadith_40/pages/hadeeth_content.dart';
import 'package:hadith_40/pages/main_page.dart';

class AppRouter {
  Route onGenerateRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => MainPage(), settings: routeSettings);
      case '/hadeeth_content':
        return MaterialPageRoute(builder: (_) => const HadeethContent(), settings: routeSettings);
      case '/hadeeth_apart_content':
        return MaterialPageRoute(builder: (_) => const HadeethApartContent(), settings: routeSettings);
      case '/about_us':
        return MaterialPageRoute(builder: (_) => const AboutUs(), settings: routeSettings);
      default:
        throw Exception('Invalid route');
    }
  }
}