import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../core/routes/app_routes.dart';
import '../../core/strings/app_constraints.dart';
import '../../core/themes/app_theme.dart';
import '../state/app_settings_state.dart';
import 'main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppSettingsState>(
      builder: (context, appSettings, _) {
        final appThemes = AppThemes(Color(appSettings.getAppThemeColor));
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.touch,
              PointerDeviceKind.stylus,
              PointerDeviceKind.trackpad,
              PointerDeviceKind.unknown,
            },
          ),
          onGenerateRoute: AppRoutes.onRouteGenerator,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
          locale: AppConstraints.appLocales[appSettings.getLocaleIndex],
          theme: appThemes.lightTheme,
          darkTheme: appThemes.darkTheme,
          themeMode: appSettings.getThemeMode,
          home: const MainPage(),
        );
      },
    );
  }
}
