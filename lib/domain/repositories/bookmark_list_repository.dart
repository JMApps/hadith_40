import 'package:hadith_40/domain/entities/bookmark_hadith_entity.dart';

abstract class BookmarkListRepository {
  Future<List<BookmarkHadithEntity>> getBookmarksChapterHadiths({
    required String tableName,
    required List<int> bookmarks,
  });
}