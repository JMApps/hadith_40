import 'package:flutter/material.dart';


class AppRoutes {
  static Route<dynamic> onRouteGenerator(RouteSettings routeSettings) {
    final builder = routes[routeSettings.name];

    if (builder != null) {
      return MaterialPageRoute(
        builder: (context) {
          return builder(context, routeSettings.arguments);
        },
      );
    }

    throw Exception('Invalid route');
  }

  static Map<String, Widget Function(BuildContext, dynamic)> routes = {
    // RoutePageNames.contentHadithPage: (context, args) {
    //   final HadithArgs hadithArgs = args;
    //   return ContentHadithPage(hadithId: hadithArgs.hadithId);
    // },
    // RoutePageNames.listApartHadithPage: (context, args) {
    //   final HadithArgs hadithArgs = args;
    //   return ListApartHadithPage(hadithId: hadithArgs.hadithId);
    // },
    // RoutePageNames.contentApartHadith: (context, args) {
    //   final HadithArgs hadithArgs = args;
    //   return ContentApartHadithPage(hadithId: hadithArgs.hadithId);
    // },
  };
}
