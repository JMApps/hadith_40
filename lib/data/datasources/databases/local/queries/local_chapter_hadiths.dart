import 'package:hadith_40/data/datasources/databases/local/chapter_interface.dart';
import 'package:hadith_40/data/datasources/databases/local/database_helper.dart';
import 'package:hadith_40/data/models/chapter_hadith.dart';
import 'package:sqflite/sqlite_api.dart';

class LocalChapterHadiths implements ChapterInterface {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Future<List<ChapterHadith>> getChapterHadiths({required String tableName}) async {
    final Database dbClient = await databaseHelper.db;
    final List<Map<String, Object?>> res = await dbClient.query(tableName);
    List<ChapterHadith>? allChapterHadiths = res.isNotEmpty ? res.map((c) => ChapterHadith.fromMap(c)).toList() : null;
    return allChapterHadiths!;
  }
}
