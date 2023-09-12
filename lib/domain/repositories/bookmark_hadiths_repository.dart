import 'package:hadith_40/domain/entities/chapter_hadith_entity.dart';

abstract class BookmarkHadithsRepository {
  Future<List<ChapterHadithEntity>> getBookmarkHadiths({
    required String tableName,
    required List<int> bookmarks,
  });
}
