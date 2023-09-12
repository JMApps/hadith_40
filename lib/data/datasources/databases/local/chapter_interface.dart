import 'package:hadith_40/data/models/chapter_hadith_model.dart';

abstract class ChapterInterface {
  Future<List<ChapterHadithModel>> getChapterHadiths({
    required String tableName,
  });
}
