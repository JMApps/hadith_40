import 'package:hadith_40/data/datasources/databases/local/bookmark_interface.dart';
import 'package:hadith_40/data/datasources/databases/local/database_helper.dart';
import 'package:hadith_40/data/models/chapter_hadith.dart';
import 'package:sqflite/sqlite_api.dart';

class LocalBookmarkHadiths implements BookmarkInterface {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Future<List<ChapterHadith>> getBookmarkHadiths({required String tableName, required List<int> bookmarks}) async {
    final Database dbClient = await databaseHelper.db;
    final List<Map<String, Object?>> res = await dbClient.query(tableName, where: 'id in (${bookmarks.map((id) => '?').join(', ')})', whereArgs: bookmarks);
    List<ChapterHadith>? allChapterHadiths = res.isNotEmpty ? res.map((c) => ChapterHadith.fromMap(c)).toList() : null;
    return allChapterHadiths!;
  }
}
