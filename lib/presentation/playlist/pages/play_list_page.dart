import 'package:flutter/material.dart';
import 'package:hadith_40/presentation/state/play_list_state.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';
import '../lists/play_list_list.dart';
import '../widgets/play_list_player.dart';

class PlayListPage extends StatefulWidget {
  const PlayListPage({super.key});

  @override
  State<PlayListPage> createState() => _PlayListPageState();
}

class _PlayListPageState extends State<PlayListPage> {
  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlayListState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text(locale.player),
        ),
        body: PlayListList(tableName: locale.tableName),
        bottomNavigationBar: PlayListPlayer(),
      ),
    );
  }
}
