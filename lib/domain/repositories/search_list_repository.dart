import 'package:hadith_40/domain/entities/search_hadith_entity.dart';

abstract class SearchListRepository {
  Future<List<SearchHadithEntity>> getSearchChapterHadiths({
    required String tableName,
  });
}
