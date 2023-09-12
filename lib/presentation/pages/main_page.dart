import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hadith_40/presentation/pages/about_us_page.dart';
import 'package:hadith_40/presentation/pages/bookmarks_page.dart';
import 'package:hadith_40/presentation/pages/chapters_page.dart';
import 'package:hadith_40/presentation/pages/settings_page.dart';
import 'package:hadith_40/presentation/uistate/main_ui_state.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final List<Widget> _mainScreens = [
    const ChaptersPage(),
    const BookmarksPage(),
    const SettingsPage(),
    const AboutUsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final MainUiState mainUiState = Provider.of<MainUiState>(context);
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Scaffold(
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        child: _mainScreens[mainUiState.getBottomBarIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: mainUiState.getBottomBarIndex,
        onTap: (int? index) => mainUiState.setBottomBarIndex = index!,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.rectangle_grid_1x2),
            label: locale.hadiths,
            tooltip: locale.hadiths,
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.bookmark),
            label: locale.bookmarks,
            tooltip: locale.bookmarks,
          ),
          BottomNavigationBarItem(
            icon: const Icon(CupertinoIcons.settings),
            label: locale.settings,
            tooltip: locale.settings,
          ),
          const BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.info),
            label: 'О нас',
            tooltip: 'О нас',
          ),
        ],
      ),
    );
  }
}
