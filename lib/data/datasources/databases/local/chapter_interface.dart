import 'package:hadith_40/data/models/chapter_hadith.dart';

abstract class ChapterInterface {
  Future<List<ChapterHadith>> getChapterHadiths({
    required String tableName,
  });
}
