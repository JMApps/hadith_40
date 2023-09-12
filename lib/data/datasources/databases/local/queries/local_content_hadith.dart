import 'package:hadith_40/data/datasources/databases/local/content_hadith_interface.dart';
import 'package:hadith_40/data/datasources/databases/local/database_helper.dart';
import 'package:hadith_40/data/models/content_hadith_model.dart';
import 'package:sqflite/sqlite_api.dart';

class LocalContentHadith implements ContentHadithInterface {
  final DatabaseHelper databaseHelper = DatabaseHelper();

  @override
  Future<List<ContentHadithModel>> getContentHadith({required String tableName, required int hadithId}) async {
    final Database dbClient = await databaseHelper.db;
    final List<Map<String, Object?>> res = await dbClient.query(tableName);
    List<ContentHadithModel>? contentHadith = res.isNotEmpty ? res.map((c) => ContentHadithModel.fromMap(c)).toList() : null;
    return contentHadith!;
  }
}