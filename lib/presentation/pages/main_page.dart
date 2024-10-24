import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../core/routes/route_page_names.dart';
import '../../core/strings/app_strings.dart';
import '../../core/styles/app_styles.dart';
import '../../data/models/arguments/hadith_args.dart';
import '../apart/pages/list_apart_hadiths_page.dart';
import '../main/pages/favorite_hadiths_page.dart';
import '../main/pages/main_hadiths_page.dart';
import '../main/widgets/search_hadiths_delegate.dart';
import '../settings/pages/app_settings_page.dart';
import '../state/hadiths_state.dart';
import '../state/main_state.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final List<Widget> _mainScreens = [
    MainHadithsPage(),
    FavoriteHadithsPage(),
    ListApartHadithsPage(),
    AppSettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final MainState mainState = Provider.of<MainState>(context);
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.appName),
        actions: [
          IconButton.filledTonal(
            onPressed: () async {
              // Load last hadith
              await Navigator.pushNamed(
                context,
                RoutePageNames.contentHadithPage,
                arguments: HadithArgs(hadithId: Provider.of<HadithsState>(context, listen: false).getLastHadithId),
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
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: _mainScreens[mainState.getBottomIndex],
      ),
      bottomNavigationBar: Card(
        margin: EdgeInsets.zero,
        elevation: 0,
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          removeBottom: true,
          child: Padding(
            padding: AppStyles.paddingMini,
            child: SalomonBottomBar(
              selectedItemColor: appColors.primary,
              unselectedItemColor: appColors.secondary,
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(CupertinoIcons.square_fill_on_square_fill),
                  title: _itemText(title: AppStrings.hadiths),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.bookmarks),
                  title: _itemText(title: AppStrings.favorites),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(CupertinoIcons.layers_alt_fill),
                  title: _itemText(title: AppStrings.apart),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.settings),
                  title: _itemText(title: AppStrings.settings),
                ),
              ],
              currentIndex: mainState.getBottomIndex,
              onTap: (int index) {
                mainState.setBottomIndex = index;
              },
            ),
          ),
        ),
      ),
    );
  }
  Text _itemText({required String title}) {
    return Text(title, style: AppStyles.mainTextStyle16);
  }
}
