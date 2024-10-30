import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../lists/favorite_hadiths_list.dart';
import '../../state/scroll_page_state.dart';
import '../../widgets/fab_to_start.dart';

class FavoriteHadithsPage extends StatelessWidget {
  const FavoriteHadithsPage({super.key});

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
        body: FavoriteHadithsList(tableName: locale.tableName),
        floatingActionButton: FabTopStart(),
      ),
    );
  }
}
