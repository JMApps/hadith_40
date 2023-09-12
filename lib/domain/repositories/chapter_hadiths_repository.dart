import 'package:hadith_40/domain/entities/chapter_hadith_entity.dart';

abstract class ChapterHadithsRepository {
  Future<List<ChapterHadithEntity>> getChapterHadiths({
    required String tableName,
  });
}
