import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:share_plus/share_plus.dart';
import '../../../l10n/app_localizations.dart';

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
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final appColors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.appName),
        leading: IconButton(
          onPressed: () async {
            await SharePlus.instance.share(ShareParams(text: [locale.appName, locale.versionIOS, AppStrings.linkIOS, locale.versionAndroid, AppStrings.linkAndroid].join('\n\n')));
          },
          tooltip: locale.share,
          icon: Icon(CupertinoIcons.share),
        ),
        actions: [
          Consumer<HadithsState>(
            builder: (context, hadithsState, _) {
              return IconButton.filledTonal(
                onPressed: () async {
                  await Navigator.pushNamed(
                    context,
                    RoutePageNames.contentHadithPage,
                    arguments: HadithArgs(
                      hadithId: hadithsState.getLastHadithId,
                    ),
                  );
                },
                tooltip: locale.continueRead,
                icon: Text(
                  Provider.of<HadithsState>(context).getLastHadithId.toString(),
                  style: TextStyle(
                    color: appColors.primary,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              );
            },
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, RoutePageNames.playListPage);
            },
            tooltip: locale.player,
            icon: Icon(Icons.playlist_play_rounded),
          ),
          IconButton(
            onPressed: () async {
              await showSearch(
                context: context,
                delegate: SearchHadithsDelegate(
                  tableName: locale.tableName,
                  searchLabel: locale.startSearch,
                ),
              );
            },
            tooltip: locale.search,
            icon: Icon(CupertinoIcons.search),
          ),
        ],
      ),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 350),
        transitionBuilder: (Widget child, Animation<double> animation) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
        child: Consumer<MainState>(
          builder: (context, mainState, _) {
            return _mainScreens[mainState.getBottomIndex];
          },
        ),
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
            child: Consumer<MainState>(
              builder: (context, mainState, _) {
                return SalomonBottomBar(
                  selectedItemColor: appColors.primary,
                  unselectedItemColor: appColors.secondary,
                  items: [
                    SalomonBottomBarItem(
                      icon: const Icon(CupertinoIcons.square_stack_fill),
                      title: _itemText(title: locale.hadiths),
                    ),
                    SalomonBottomBarItem(
                      icon: const Icon(Icons.bookmarks),
                      title: _itemText(title: locale.favorites),
                    ),
                    SalomonBottomBarItem(
                      icon: const Icon(CupertinoIcons.layers_alt_fill),
                      title: _itemText(title: locale.apart),
                    ),
                    SalomonBottomBarItem(
                      icon: const Icon(Icons.settings),
                      title: _itemText(title: locale.settings),
                    ),
                  ],
                  currentIndex: mainState.getBottomIndex,
                  onTap: (int index) {
                    mainState.setBottomIndex = index;
                  },
                );
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
