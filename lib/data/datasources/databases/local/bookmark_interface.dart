import 'package:hadith_40/data/models/chapter_hadith_model.dart';

abstract class BookmarkInterface {
  Future<List<ChapterHadithModel>> getBookmarkHadiths({
    required String tableName,
    required List<int> bookmarks,
  });
}
