import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../state/scroll_page_state.dart';
import '../../widgets/fab_to_start.dart';
import '../lists/main_hadiths_list.dart';

class MainHadithsPage extends StatefulWidget {
  const MainHadithsPage({super.key});

  @override
  State<MainHadithsPage> createState() => _MainHadithsPageState();
}

class _MainHadithsPageState extends State<MainHadithsPage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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
        body: MainHadithsList(tableName: locale.tableName),
        floatingActionButton: FabTopStart(),
      ),
    );
  }
}
