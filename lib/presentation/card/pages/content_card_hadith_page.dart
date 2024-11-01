import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/route_page_names.dart';
import '../../../core/strings/app_strings.dart';
import '../../../data/repositories/apart_hadith_data_repository.dart';
import '../../../data/services/database_service.dart';
import '../../../domain/usecases/apart_hadiths_use_case.dart';
import '../../state/apart_hadiths_state.dart';
import '../../state/card_mode_state.dart';
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
          create: (_) => ApartHadithsState(
            ApartHadithsUseCase(
              apartHadithsRepository: ApartHadithDataRepository(
                DatabaseService(),
              ),
            ),
          ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text('${AppStrings.hadith} $hadithId'),
          actions: [
            IconButton.filledTonal(
              onPressed: () async {
                await Navigator.pushNamed(
                  context,
                  RoutePageNames.contentSettingsPage,
                );
              },
              tooltip: AppStrings.settings,
              icon: Icon(Icons.settings),
            ),
            Consumer<CardModeState>(
              builder: (context, cardMode, _) {
                return IconButton.filledTonal(
                  onPressed: () => cardMode.toggleReverseCard(),
                  tooltip: AppStrings.reverseCard,
                  icon: Icon(CupertinoIcons.rectangle_fill_on_rectangle_fill),
                );
              },
            ),
          ],
        ),
        body: Scrollbar(
          child: SingleChildScrollView(
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
        ),
      ),
    );
  }
}
