import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hadith_40/data/datasources/local/databases/database_helper.dart';
import 'package:hadith_40/data/repositories/chapter_list_data_repository.dart';
import 'package:hadith_40/domain/entities/chapter_hadith_entity.dart';
import 'package:hadith_40/domain/usecases/chapter_list_use_case.dart';
import 'package:hadith_40/presentation/items/main_hadith_item.dart';
import 'package:hadith_40/presentation/widgets/error_text.dart';

class HadithPage extends StatefulWidget {
  const HadithPage({super.key});

  @override
  State<HadithPage> createState() => _HadithPageState();
}

class _HadithPageState extends State<HadithPage> {
  late final DatabaseHelper _databaseHelper;
  late final ChapterListDataRepository _chapterHadithDataRepository;
  late final ChapterListUseCase _chapterListUseCase;

  @override
  void initState() {
    _databaseHelper = DatabaseHelper();
    _chapterHadithDataRepository = ChapterListDataRepository(databaseHelper: _databaseHelper);
    _chapterListUseCase = ChapterListUseCase(chapterHadithRepository: _chapterHadithDataRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return FutureBuilder<List<ChapterHadithEntity>>(
      future: _chapterListUseCase.getAllChapterHadiths(tableName: locale.tableName),
      builder: (BuildContext context, AsyncSnapshot<List<ChapterHadithEntity>> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text(locale.appName),
            ),
            body: CupertinoScrollbar(
              child: ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (BuildContext context, int index) {
                  final ChapterHadithEntity chapterHadithEntity = snapshot.data![index];
                  return MainHadithItem(
                    model: chapterHadithEntity,
                    index: index,
                  );
                },
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return ErrorText(
            errorMessage: snapshot.error.toString(),
          );
        }
        return const Center(
          child: CircularProgressIndicator.adaptive(),
        );
      },
    );
  }
}
