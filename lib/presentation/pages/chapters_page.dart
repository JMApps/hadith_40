import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hadith_40/data/datasources/databases/local/queries/local_chapter_hadiths.dart';
import 'package:hadith_40/data/repositories/chapter_hadith_data_repository.dart';
import 'package:hadith_40/domain/entities/chapter_hadith_entity.dart';
import 'package:hadith_40/domain/usecases/chapter_hadiths_use_case.dart';
import 'package:hadith_40/presentation/items/main_hadith_item.dart';
import 'package:hadith_40/presentation/widgets/error_text.dart';
import 'package:hadith_40/presentation/widgets/search_hadith_delegate.dart';

class ChaptersPage extends StatefulWidget {
  const ChaptersPage({super.key});

  @override
  State<ChaptersPage> createState() => _ChaptersPageState();
}

class _ChaptersPageState extends State<ChaptersPage> {
  late final LocalChapterHadiths _localChapterHadiths;
  late final ChapterHadithDataRepository _chapterHadithDataRepository;
  late final ChapterHadithsUseCase _chapterHadithsUseCase;

  @override
  void initState() {
    _localChapterHadiths = LocalChapterHadiths();
    _chapterHadithDataRepository = ChapterHadithDataRepository(localChapterHadiths: _localChapterHadiths);
    _chapterHadithsUseCase = ChapterHadithsUseCase(chapterHadithsRepository: _chapterHadithDataRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return FutureBuilder<List<ChapterHadithEntity>>(
      future: _chapterHadithsUseCase.getChapterHadiths(tableName: locale.tableName),
      builder: (BuildContext context, AsyncSnapshot<List<ChapterHadithEntity>> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text(locale.appName),
              actions: [
                IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: SearchHadithDelegate(
                        hintText: locale.searchHadith,
                      ),
                    );
                  },
                  icon: const Icon(CupertinoIcons.search),
                ),
              ],
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
