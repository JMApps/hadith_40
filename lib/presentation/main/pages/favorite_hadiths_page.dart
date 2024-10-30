import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../lists/favorite_hadiths_list.dart';
import '../../state/scroll_page_state.dart';
import '../../widgets/fab_to_start.dart';

class FavoriteHadithsPage extends StatefulWidget {
  const FavoriteHadithsPage({super.key});

  @override
  State<FavoriteHadithsPage> createState() => _FavoriteHadithsPageState();
}

class _FavoriteHadithsPageState extends State<FavoriteHadithsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ScrollPageState(_scrollController),
        ),
      ],
      child: Scaffold(
        body: FavoriteHadithsList(tableName: locale.tableName),
        floatingActionButton: FabTopStart(),
      ),
    );
  }
}
