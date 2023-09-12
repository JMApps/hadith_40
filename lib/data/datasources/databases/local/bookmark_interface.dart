import 'package:hadith_40/data/models/chapter_hadith.dart';

abstract class BookmarkInterface {
  Future<List<ChapterHadith>> getBookmarkHadiths({
    required String tableName,
    required List<int> bookmarks,
  });
}
