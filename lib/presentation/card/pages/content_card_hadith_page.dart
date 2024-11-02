import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../core/routes/route_page_names.dart';
import '../../state/card_mode_state.dart';
import '../../state/scroll_page_state.dart';
import '../../widgets/fab_to_start.dart';
import '../../widgets/future_chapter_title.dart';
import '../lists/card_hadith_list.dart';

class ContentCardHadithPage extends StatelessWidget {
  const ContentCardHadithPage({
    super.key,
    required this.tableName,
    required this.hadithId,
  });

  final String tableName;
  final int hadithId;

  @override
  Widget build(BuildContext context) {
    AppLocalizations locale = AppLocalizations.of(context)!;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CardModeState(),
        ),
        ChangeNotifierProvider(
          create: (_) => ScrollPageState(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('${locale.hadith} $hadithId'),
          actions: [
            IconButton.filledTonal(
              onPressed: () async {
                await Navigator.pushNamed(
                  context,
                  RoutePageNames.contentSettingsPage,
                );
              },
              tooltip: locale.settings,
              icon: Icon(Icons.settings_outlined),
            ),
            Consumer<CardModeState>(
              builder: (context, cardMode, _) {
                return IconButton.filledTonal(
                  onPressed: () => cardMode.toggleReverseCard(),
                  tooltip: locale.reverseCard,
                  icon: Icon(CupertinoIcons.rectangle_compress_vertical),
                );
              },
            ),
          ],
        ),
        body: Consumer<ScrollPageState>(
          builder: (context, scrollPage, _) {
            return Scrollbar(
              controller: scrollPage.getScrollController,
              child: SingleChildScrollView(
                controller: scrollPage.getScrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    FutureChapterTitle(
                      tableName: tableName,
                      hadithId: hadithId,
                    ),
                    CardHadithList(
                      tableName: locale.apartTableName,
                      hadithId: hadithId,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
        floatingActionButton: FabTopStart(),
      ),
    );
  }
}
