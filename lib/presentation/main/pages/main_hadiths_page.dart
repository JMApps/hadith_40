import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../l10n/app_localizations.dart';

import '../../state/scroll_page_state.dart';
import '../../widgets/fab_to_start.dart';
import '../lists/main_hadiths_list.dart';

class MainHadithsPage extends StatelessWidget {
  const MainHadithsPage({super.key});

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ScrollPageState(),
        ),
      ],
      child: Scaffold(
        body: MainHadithsList(tableName: locale.tableName),
        floatingActionButton: FabTopStart(),
      ),
    );
  }
}
