import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/route_page_names.dart';
import '../../../core/strings/app_strings.dart';
import '../../../data/models/arguments/apart_hadith_args.dart';
import '../../../data/repositories/apart_hadith_data_repository.dart';
import '../../../data/services/database_service.dart';
import '../../../domain/usecases/apart_hadiths_use_case.dart';
import '../../state/apart_hadiths_state.dart';
import '../../widgets/future_chapter_title.dart';
import '../lists/content_apart_hadiths_list.dart';

class ContentApartHadithPage extends StatelessWidget {
  const ContentApartHadithPage({
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
            IconButton.filledTonal(
              onPressed: () async {
                await Navigator.pushNamed(
                  context,
                  RoutePageNames.contentCardHadithPage,
                  arguments: ApartHadithArgs(
                    tableName: locale.tableName,
                    hadithId: hadithId,
                  ),
                );
              },
              tooltip: AppStrings.cardsMode,
              icon: Icon(CupertinoIcons.creditcard_fill),
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
                ContentApartHadithsList(
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
