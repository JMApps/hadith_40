import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hadith_40/core/styles/app_styles.dart';
import 'package:hadith_40/data/datasources/local/databases/database_helper.dart';
import 'package:hadith_40/data/repositories/content_hadith_data_repository.dart';
import 'package:hadith_40/domain/entities/content_hadith_entity.dart';
import 'package:hadith_40/domain/usecases/content_hadith_use_case.dart';
import 'package:hadith_40/presentation/uistate/main_ui_state.dart';
import 'package:hadith_40/presentation/widgets/content_arabic_html_text.dart';
import 'package:hadith_40/presentation/widgets/content_html_text.dart';
import 'package:hadith_40/presentation/widgets/error_text.dart';
import 'package:provider/provider.dart';

class ContentHadithPage extends StatefulWidget {
  const ContentHadithPage({super.key, required this.hadithId});

  final int hadithId;

  @override
  State<ContentHadithPage> createState() => _ContentHadithPageState();
}

class _ContentHadithPageState extends State<ContentHadithPage> {
  late final DatabaseHelper _databaseHelper;
  late final ContentHadithDataRepository _contentHadithDataRepository;
  late final ContentHadithUseCase _contentHadithUseCase;

  @override
  void initState() {
    _databaseHelper = DatabaseHelper();
    _contentHadithDataRepository = ContentHadithDataRepository(databaseHelper: _databaseHelper);
    _contentHadithUseCase = ContentHadithUseCase(contentHadithRepository: _contentHadithDataRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    final ColorScheme appColors = Theme.of(context).colorScheme;
    final MainUiState mainUiState = Provider.of<MainUiState>(context);
    return FutureBuilder<List<ContentHadithEntity>>(
      future: _contentHadithUseCase.getContentHadithById(tableName: locale.tableName, hadithId: widget.hadithId),
      builder: (BuildContext context, AsyncSnapshot<List<ContentHadithEntity>> snapshot) {
        if (snapshot.hasData) {
          final ContentHadithEntity model = snapshot.data![mainUiState.getContentPageIndex];
          return Scaffold(
            appBar: AppBar(
              title: Text(model.hadithNumber),
            ),
            body: PageView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                final ContentHadithEntity model = snapshot.data![index];
                return CupertinoScrollbar(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: AppStyles.mainMardingMini,
                          alignment: Alignment.center,
                          color: appColors.inversePrimary,
                          child: Text(model.hadithTitle),
                        ),
                        ListTile(
                          contentPadding: AppStyles.mainMardingMini,
                          title: Padding(
                            padding: const EdgeInsets.only(bottom: 16),
                            child: ContentArabicHtmlText(content: model.hadithArabic),
                          ),
                          subtitle: ContentHtmlText(content: model.hadithTranslation),
                        ),
                      ],
                    ),
                  ),
                );
              },
              onPageChanged: (int? pageIndex) {
                mainUiState.setContentPageIndex = pageIndex!;
              },
            ),
          );
        } else if (snapshot.hasError) {
          return ErrorText(
            errorMessage: snapshot.error.toString(),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
      },
    );
  }
}
