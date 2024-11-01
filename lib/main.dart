import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import 'core/strings/app_constraints.dart';
import 'data/repositories/apart_hadith_data_repository.dart';
import 'data/repositories/hadith_data_repository.dart';
import 'data/services/database_service.dart';
import 'data/services/notification/notification_service.dart';
import 'domain/usecases/apart_hadiths_use_case.dart';
import 'domain/usecases/hadiths_use_case.dart';
import 'presentation/pages/root_page.dart';
import 'presentation/state/apart_hadiths_state.dart';
import 'presentation/state/app_settings_state.dart';
import 'presentation/state/content_settings_state.dart';
import 'presentation/state/hadiths_state.dart';
import 'presentation/state/main_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(AppConstraints.keyMainAppSettingsBox);
  await Hive.openBox(AppConstraints.keyContentSettingsBox);
  await Hive.openBox(AppConstraints.keyBookmarkHadithsBox);

  await NotificationService().setupNotification();

  final DatabaseService databaseService = DatabaseService();
  await databaseService.initializeDatabase();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MainState(),
        ),
        ChangeNotifierProvider(
          create: (_) => AppSettingsState(),
        ),
        ChangeNotifierProvider(
          create: (_) => HadithsState(
            HadithsUseCase(
              hadithsRepository: HadithDataRepository(databaseService),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ApartHadithsState(
            ApartHadithsUseCase(
              apartHadithsRepository: ApartHadithDataRepository(databaseService),
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (_) => ContentSettingsState(),
        ),
      ],
      child: const RootPage(),
    ),
  );
}
