import 'package:hadith_40/data/datasources/databases/local/content_hadith_interface.dart';
import 'package:hadith_40/data/datasources/databases/local/database_helper.dart';
import 'package:hadith_40/data/models/content_hadith.dart';
import 'package:sqflite/sqlite_api.dart';

class LocalContentHadith implements ContentHadithInterface {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Future<List<ContentHadith>> getContentHadith({required String tableName, required int hadithId}) async {
    final Database dbClient = await databaseHelper.db;
    final List<Map<String, Object?>> res = await dbClient.query(tableName);
    List<ContentHadith>? contentHadith = res.isNotEmpty ? res.map((c) => ContentHadith.fromMap(c)).toList() : null;
    return contentHadith!;
  }
}