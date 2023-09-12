import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hadith_40/data/datasources/databases/local/queries/local_bookmark_hadiths.dart';
import 'package:hadith_40/data/repositories/bookmark_hadiths_data_repository.dart';
import 'package:hadith_40/data/repositories/state/toggle_bookmark_state.dart';
import 'package:hadith_40/domain/entities/chapter_hadith_entity.dart';
import 'package:hadith_40/domain/usecases/bookmark_hadiths_use_case.dart';
import 'package:hadith_40/presentation/items/bookmark_hadith_item.dart';
import 'package:hadith_40/presentation/widgets/data_is_empty_text.dart';
import 'package:provider/provider.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  late final LocalBookmarkHadiths _localBookmarkHadiths;
  late final BookmarkHadithsDataRepository _bookmarkHadithsDataRepository;
  late final BookmarkHadithsUseCase _bookmarkListUseCase;

  @override
  void initState() {
    _localBookmarkHadiths = LocalBookmarkHadiths();
    _bookmarkHadithsDataRepository = BookmarkHadithsDataRepository(localBookmarkHadiths: _localBookmarkHadiths);
    _bookmarkListUseCase = BookmarkHadithsUseCase(bookmarkHadithsRepository: _bookmarkHadithsDataRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.bookmarks),
      ),
      body: Consumer<ToggleBookmarkState>(
        builder: (BuildContext context, _, __) {
          return FutureBuilder<List<ChapterHadithEntity>>(
            future: _bookmarkListUseCase.getBookmarkHadiths(
              tableName: locale.tableName,
              bookmarks: context.read<ToggleBookmarkState>().getBookmarkHadithsList,
            ),
            builder: (BuildContext context, AsyncSnapshot<List<ChapterHadithEntity>> snapshot) {
              if (snapshot.hasData) {
                return CupertinoScrollbar(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final ChapterHadithEntity bookmarkHadithEntity = snapshot.data![index];
                      return BookmarkHadithItem(
                        model: bookmarkHadithEntity,
                        index: index,
                      );
                    },
                  ),
                );
              } else {
                return DataIsEmptyText(message: locale.isEmptyBookmarks);
              }
            },
          );
        },
      ),
    );
  }
}
