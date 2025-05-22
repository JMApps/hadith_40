import 'package:flutter/material.dart';

import '../../data/models/arguments/apart_hadith_args.dart';
import '../../data/models/arguments/card_hadith_args.dart';
import '../../data/models/arguments/hadith_args.dart';
import '../../presentation/apart/pages/content_apart_hadith_page.dart';
import '../../presentation/card/pages/content_card_hadith_page.dart';
import '../../presentation/content/pages/content_hadith_page.dart';
import '../../presentation/settings/pages/content_settings_page.dart';
import 'route_page_names.dart';

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
    RoutePageNames.contentHadithPage: (context, args) {
      final HadithArgs hadithArgs = args;
      return ContentHadithPage(hadithId: hadithArgs.hadithId);
    },
    RoutePageNames.contentApartHadith: (context, args) {
      final ApartHadithArgs apartHadithArgs = args;
      return ContentApartHadithPage(tableName: apartHadithArgs.tableName, hadithId: apartHadithArgs.hadithId);
    },
    RoutePageNames.contentCardHadithPage: (context, args) {
      final CardHadithArgs cardHadithArgs = args;
      return ContentCardHadithPage(tableName: cardHadithArgs.tableName, hadithId: cardHadithArgs.hadithId);
    },
    RoutePageNames.contentSettingsPage: (context, args) => ContentSettingsPage(),
  };
}
