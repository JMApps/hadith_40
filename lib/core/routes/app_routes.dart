import 'package:flutter/material.dart';
import 'package:hadith_40/core/routes/route_page_names.dart';
import 'package:hadith_40/data/models/arguments/apart_card_hadith_args.dart';
import 'package:hadith_40/data/models/arguments/apart_hadith_args.dart';
import 'package:hadith_40/data/models/arguments/content_hadith_args.dart';
import 'package:hadith_40/presentation/pages/apart_hadith_card_page.dart';
import 'package:hadith_40/presentation/pages/apart_hadith_page.dart';
import 'package:hadith_40/presentation/pages/content_hadith_page.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutePageNames.pageContentHadithName:
        final ContentHadithArgs contentHadithArgs = routeSettings.arguments as ContentHadithArgs;
        return MaterialPageRoute(
          builder: (_) =>
              ContentHadithPage(hadithId: contentHadithArgs.hadithId),
        );
      case RoutePageNames.apartContentHadithName:
        final ApartHadithArgs apartHadithArgs = routeSettings.arguments as ApartHadithArgs;
        return MaterialPageRoute(
          builder: (_) =>
              ApartHadithPage(hadithId: apartHadithArgs.hadithId, hadithNumber: apartHadithArgs.hadithNumber),
        );
      case RoutePageNames.apartCardHadithName:
        final ApartCardHadithArgs apartCardHadithArgs = routeSettings.arguments as ApartCardHadithArgs;
        return MaterialPageRoute(
          builder: (_) =>
              ApartHadithCardPage(hadithId: apartCardHadithArgs.hadithId),
        );
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
