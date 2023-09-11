import 'package:hadith_40/data/datasources/local/databases/database_helper.dart';
import 'package:hadith_40/data/models/chapter_hadith.dart';
import 'package:hadith_40/domain/entities/chapter_hadith_entity.dart';
import 'package:hadith_40/domain/repositories/chapter_list_repository.dart';
import 'package:sqflite/sqflite.dart';

class ChapterListDataRepository implements ChapterListRepository {
  final DatabaseHelper databaseHelper;

  ChapterListDataRepository({required this.databaseHelper});

  @override
  Future<List<ChapterHadithEntity>> getAllChapterHadiths(
      {required String tableName}) async {
    final Database dbClient = await databaseHelper.db;
    final List<Map<String, Object?>> res = await dbClient.query(tableName);
    List<ChapterHadithEntity>? allChapterHadiths = res.isNotEmpty ? res.map((c) => _mapToHadithEntity(ChapterHadith.fromMap(c))).toList() : null;
    return allChapterHadiths!;
  }

  // Mapping to entity
  ChapterHadithEntity _mapToHadithEntity(ChapterHadith hadith) {
    return ChapterHadithEntity(
      id: hadith.id,
      hadithNumber: hadith.hadithNumber,
      hadithTitle: hadith.hadithTitle,
    );
  }
}
