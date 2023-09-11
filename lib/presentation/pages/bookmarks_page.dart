import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:hadith_40/data/datasources/local/databases/database_helper.dart';
import 'package:hadith_40/data/datasources/state/toggle_bookmark_state.dart';
import 'package:hadith_40/data/repositories/bookmark_list_data_repository.dart';
import 'package:hadith_40/domain/entities/bookmark_hadith_entity.dart';
import 'package:hadith_40/domain/usecases/toggle_bookmark_use_case.dart';
import 'package:hadith_40/presentation/items/bookmark_hadith_item.dart';
import 'package:hadith_40/presentation/widgets/data_is_empty_text.dart';
import 'package:provider/provider.dart';

class BookmarksPage extends StatefulWidget {
  const BookmarksPage({super.key});

  @override
  State<BookmarksPage> createState() => _BookmarksPageState();
}

class _BookmarksPageState extends State<BookmarksPage> {
  late final DatabaseHelper _databaseHelper;
  late final BookmarkListDataRepository _bookmarkHadithDataRepository;
  late final ToggleBookmarkUseCase _bookmarkHadithsUseCase;

  @override
  void initState() {
    _databaseHelper = DatabaseHelper();
    _bookmarkHadithDataRepository = BookmarkListDataRepository(databaseHelper: _databaseHelper);
    _bookmarkHadithsUseCase = ToggleBookmarkUseCase(bookmarkHadithRepository: _bookmarkHadithDataRepository);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AppLocalizations locale = AppLocalizations.of(context)!;
    return Consumer<ToggleBookmarkState>(
      builder: (BuildContext context, _, __) {
        return FutureBuilder<List<BookmarkHadithEntity>>(
          future: _bookmarkHadithsUseCase.getBookmarkChapterHadiths(
            tableName: locale.tableName,
            bookmarks: context.read<ToggleBookmarkState>().getBookmarkHadithsList,
          ),
          builder: (BuildContext context, AsyncSnapshot<List<BookmarkHadithEntity>> snapshot) {
            if (snapshot.hasData) {
              return Scaffold(
                appBar: AppBar(
                  title: Text(locale.bookmarks),
                ),
                body: CupertinoScrollbar(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      final BookmarkHadithEntity bookmarkHadithEntity = snapshot.data![index];
                      return BookmarkHadithItem(
                        model: bookmarkHadithEntity,
                        index: index,
                      );
                    },
                  ),
                ),
              );
            }
            return DataIsEmptyText(message: locale.isEmptyBookmarks);
          },
        );
      },
    );
  }
}
