import 'package:hadith_40/domain/entities/chapter_hadith_entity.dart';

abstract class ChapterHadithRepository {
  Future<List<ChapterHadithEntity>> getAllChapterHadiths({
    required String tableName,
  });
}
