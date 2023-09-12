import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hadith_40/core/strings/app_constraints.dart';
import 'package:hadith_40/data/repositories/state/toggle_bookmark_state.dart';
import 'package:hadith_40/presentation/pages/root_page.dart';
import 'package:hadith_40/presentation/uistate/app_settings_state.dart';
import 'package:hadith_40/presentation/uistate/main_ui_state.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isAndroid) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
      ),
    );
  }
  await Hive.initFlutter();
  await Hive.openBox(AppConstraints.keyMainAppSettingsBox);
  await Hive.openBox(AppConstraints.keyBookmarkHadithsBox);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainUiState(),
        ),
        ChangeNotifierProvider(
          create: (_) => ToggleBookmarkState(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppSettingsState(),
        ),
      ],
      child: const RootPage(),
    ),
  );
}
