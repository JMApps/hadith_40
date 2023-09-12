import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hadith_40/data/datasources/databases/local/queries/local_chapter_hadiths.dart';
import 'package:hadith_40/data/repositories/chapter_hadith_data_repository.dart';
import 'package:hadith_40/domain/entities/chapter_hadith_entity.dart';
import 'package:hadith_40/domain/usecases/chapter_hadiths_use_case.dart';
import 'package:hadith_40/presentation/items/search_hadith_item.dart';
import 'package:hadith_40/presentation/widgets/data_is_empty_text.dart';

class SearchFuture extends StatefulWidget {
  const SearchFuture({super.key, required this.query});

  final String query;

  @override
  State<SearchFuture> createState() => _SearchFutureState();
}

class _SearchFutureState extends State<SearchFuture> {
  List<ChapterHadithEntity> _chapterHadiths = [];
  List<ChapterHadithEntity> _recentChapterHadiths = [];

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
    final AppLocalizations? locale = AppLocalizations.of(context);
    return FutureBuilder<List>(
      future: _chapterHadithsUseCase.getChapterHadiths(tableName: locale!.tableName),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          _chapterHadiths = snapshot.data;
          _recentChapterHadiths = widget.query.isEmpty ? _chapterHadiths : _chapterHadiths.where((element) =>
          element.id.toString().contains(widget.query) ||
              element.hadithNumber.contains(widget.query.toLowerCase()) ||
              element.hadithTitle.toLowerCase().contains(widget.query.toLowerCase())).toList();
          return _recentChapterHadiths.isEmpty
              ? DataIsEmptyText(
            message: locale.searchIsEmpty,
          )
              : CupertinoScrollbar(
            child: ListView.builder(
              itemCount: _recentChapterHadiths.length,
              itemBuilder: (BuildContext context, int index) {
                return SearchHadithItem(
                  model: _recentChapterHadiths[index],
                  index: index,
                );
              },
            ),
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
