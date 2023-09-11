import 'package:hadith_40/domain/entities/chapter_hadith_entity.dart';

abstract class ChapterListRepository {
  Future<List<ChapterHadithEntity>> getAllChapterHadiths({
    required String tableName,
  });
}
