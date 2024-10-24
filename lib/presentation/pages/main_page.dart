import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../../core/styles/app_styles.dart';
import '../apart/pages/apart_hadiths_page.dart';
import '../main/pages/favorite_hadiths_page.dart';
import '../main/pages/main_hadiths_page.dart';
import '../settings/pages/app_settings_page.dart';
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
    ApartHadithsPage(),
    AppSettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final appColors = Theme.of(context).colorScheme;
    final MainState mainState = Provider.of<MainState>(context);
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Scaffold(
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
        shape: AppStyles.shapeTop,
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
                  title: Text(locale.hadiths, style: AppStyles.mainTextStyle16),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.bookmarks),
                  title: Text(locale.bookmarks, style: AppStyles.mainTextStyle16),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(CupertinoIcons.layers_alt_fill),
                  title: Text(locale.apart, style: AppStyles.mainTextStyle16),
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.settings),
                  title: Text(locale.settings, style: AppStyles.mainTextStyle16),
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
}
