import 'package:flutter/material.dart';
import 'package:hadith_40/pages/main_page.dart';

class AppRouter {
  Route onGenerateRouter(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => const MainPage(), settings: routeSettings);
      default:
        throw Exception('Invalid route');
    }
  }
}