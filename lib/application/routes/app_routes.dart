import 'package:flutter/material.dart';
import 'package:hadith_40/presentation/pages/main_page.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const MainPage(),
        );
      default: throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
