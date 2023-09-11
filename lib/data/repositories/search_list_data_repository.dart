import 'package:hadith_40/data/datasources/local/databases/database_helper.dart';
import 'package:hadith_40/data/models/search_hadith.dart';
import 'package:hadith_40/domain/entities/search_hadith_entity.dart';
import 'package:hadith_40/domain/repositories/search_list_repository.dart';
import 'package:sqflite/sqflite.dart';

class SearchListDataRepository implements SearchListRepository {
  final DatabaseHelper databaseHelper;

  SearchListDataRepository({required this.databaseHelper});

  @override
  Future<List<SearchHadithEntity>> getSearchChapterHadiths(
      {required String tableName}) async {
    final Database dbClient = await databaseHelper.db;
    final List<Map<String, Object?>> res = await dbClient.query(tableName);
    List<SearchHadithEntity>? allChapterHadiths = res.isNotEmpty ? res.map((c) => _mapToHadithEntity(SearchHadith.fromMap(c))).toList() : null;
    return allChapterHadiths!;
  }

  // Mapping to entity
  SearchHadithEntity _mapToHadithEntity(SearchHadith hadith) {
    return SearchHadithEntity(
      id: hadith.id,
      hadithNumber: hadith.hadithNumber,
      hadithTitle: hadith.hadithTitle,
    );
  }
}
