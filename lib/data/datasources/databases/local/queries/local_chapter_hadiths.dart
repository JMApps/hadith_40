import 'package:hadith_40/data/datasources/databases/local/chapter_interface.dart';
import 'package:hadith_40/data/datasources/databases/local/database_helper.dart';
import 'package:hadith_40/data/models/chapter_hadith_model.dart';
import 'package:sqflite/sqlite_api.dart';

class LocalChapterHadiths implements ChapterInterface {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Future<List<ChapterHadithModel>> getChapterHadiths({required String tableName}) async {
    final Database dbClient = await databaseHelper.db;
    final List<Map<String, Object?>> res = await dbClient.query(tableName);
    List<ChapterHadithModel>? allChapterHadiths = res.isNotEmpty ? res.map((c) => ChapterHadithModel.fromMap(c)).toList() : null;
    return allChapterHadiths!;
  }
}
