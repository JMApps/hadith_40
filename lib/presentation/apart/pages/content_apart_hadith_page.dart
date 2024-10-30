import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import '../../../core/routes/route_page_names.dart';
import '../../../core/strings/app_strings.dart';
import '../../../core/styles/app_styles.dart';
import '../../../data/repositories/apart_hadith_data_repository.dart';
import '../../../data/services/database_service.dart';
import '../../../domain/entities/hadith_entity.dart';
import '../../../domain/usecases/apart_hadiths_use_case.dart';
import '../../state/apart_hadiths_state.dart';
import '../../state/hadiths_state.dart';
import '../../widgets/main_error_text_data.dart';
import '../lists/content_apart_hadiths_list.dart';

class ContentApartHadithPage extends StatefulWidget {
  const ContentApartHadithPage({
    super.key,
    required this.tableName,
    required this.hadithId,
  });

  final String tableName;
  final int hadithId;

  @override
  State<ContentApartHadithPage> createState() => _ContentApartHadithPageState();
}

class _ContentApartHadithPageState extends State<ContentApartHadithPage> {
  late Future<HadithEntity> _futureHadith;

  @override
  void initState() {
    super.initState();
    _futureHadith = Provider.of<HadithsState>(context, listen: false).fetchHadithById(
      tableName: widget.tableName,
      hadithId: widget.hadithId,
    );
  }

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
          title: Text('${AppStrings.hadith} ${widget.hadithId}'),
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
                FutureBuilder<HadithEntity>(
                  future: _futureHadith,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final HadithEntity hadithModel = snapshot.data!;
                      return Container(
                        margin: AppStyles.withoutBottomMini,
                        padding: AppStyles.paddingMini,
                        decoration: BoxDecoration(
                            borderRadius: AppStyles.borderMini,
                            color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                        child: Text(
                          hadithModel.hadithTitle,
                          style: AppStyles.mainTextStyle18Bold,
                          textAlign: TextAlign.center,
                        ),
                      );
                    }
                    if (snapshot.hasError) {
                      return MainErrorTextData(
                          errorText: snapshot.error.toString(),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator.adaptive(),
                    );
                  },
                ),
                ContentApartHadithsList(
                  tableName: locale.apartTableName,
                  hadithId: widget.hadithId,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
