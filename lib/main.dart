import 'package:flutter/material.dart';
import 'package:hadith_40/provider/bookmark_state.dart';
import 'package:hadith_40/provider/hadeeth_settings_state.dart';
import 'package:hadith_40/provider/main_player_state.dart';
import 'package:hadith_40/provider/navigator_index_state.dart';
import 'package:hadith_40/provider/search_data.dart';
import 'package:hadith_40/router/app_router.dart';
import 'package:provider/provider.dart';

void main() {
  final appRouter = AppRouter();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<NavigatorIndexState>(create: (_) => NavigatorIndexState()),
        ChangeNotifierProvider<SearchData>(create: (_) => SearchData()),
        ChangeNotifierProvider<BookmarkState>(create: (_) => BookmarkState()),
        ChangeNotifierProvider<HadeethSettingsState>(create: (_) => HadeethSettingsState()),
        ChangeNotifierProvider<MainPlayerState>(create: (_) => MainPlayerState()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: '40 хадисов',
        theme: ThemeData(
          primarySwatch: Colors.grey,
          fontFamily: 'Gilroy',
        ),
        onGenerateRoute: appRouter.onGenerateRouter,
        initialRoute: '/',
      ),
    ),
  );
}
