import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hadith_40/core/routes/app_routes.dart';
import 'package:hadith_40/core/themes/app_theme.dart';
import 'package:hadith_40/data/datasources/state/toggle_bookmark_state.dart';
import 'package:hadith_40/presentation/uistate/main_ui_state.dart';
import 'package:provider/provider.dart';

import 'main_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainUiState(),
        ),
        ChangeNotifierProvider(
          create: (_) => ToggleBookmarkState(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: AppRoutes.onGenerateRoute,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        onGenerateTitle: (context) => AppLocalizations.of(context)!.appName,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home: const MainPage(),
      ),
    );
  }
}
