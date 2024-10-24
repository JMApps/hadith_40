import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/route_page_names.dart';
import '../../../core/strings/app_strings.dart';
import '../../../data/models/arguments/hadith_args.dart';
import '../../state/hadiths_state.dart';
import '../../state/scroll_page_state.dart';
import '../../widgets/fab_to_start.dart';
import '../lists/main_hadiths_list.dart';
import '../widgets/search_hadiths_delegate.dart';

class MainHadithsPage extends StatefulWidget {
  const MainHadithsPage({super.key});

  @override
  State<MainHadithsPage> createState() => _MainHadithsPageState();
}

class _MainHadithsPageState extends State<MainHadithsPage> {
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
        appBar: AppBar(
          title: Text(locale.appName),
          actions: [
            IconButton.filledTonal(
              onPressed: () async {
                // Load last hadith
                await Navigator.pushNamed(
                  context,
                  RoutePageNames.contentHadithPage,
                  arguments: HadithArgs(hadithId: Provider.of<HadithsState>(context).getLastHadithId),
                );
              },
              tooltip: AppStrings.continueRead,
              icon: Icon(CupertinoIcons.app_badge_fill),
            ),
            IconButton.filledTonal(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: SearchHadithsDelegate(
                    tableName: locale.tableName,
                    searchLabel: AppStrings.startSearch,
                  ),
                );
              },
              tooltip: AppStrings.search,
              icon: Icon(CupertinoIcons.search),
            ),
          ],
        ),
        body: MainHadithsList(tableName: locale.tableName),
        floatingActionButton: FabTopStart(),
      ),
    );
  }
}
