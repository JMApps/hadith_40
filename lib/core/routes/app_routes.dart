import 'package:flutter/material.dart';
import 'package:hadith_40/core/routes/route_page_names.dart';
import 'package:hadith_40/data/models/arguments/content_hadith_args.dart';
import 'package:hadith_40/presentation/pages/content_hadith_page.dart';

class AppRoutes {
  static Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case RoutePageNames.pageContentHadith:
        final ContentHadithArgs contentHadithArgs = routeSettings.arguments as ContentHadithArgs;
        return MaterialPageRoute(
          builder: (_) =>
              ContentHadithPage(hadithId: contentHadithArgs.hadithId),
        );
      default:
        throw Exception('Invalid route ${routeSettings.name}');
    }
  }
}
