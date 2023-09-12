import 'package:hadith_40/data/datasources/databases/local/apart_interface.dart';
import 'package:hadith_40/data/datasources/databases/local/database_helper.dart';
import 'package:hadith_40/data/models/apart_hadith_model.dart';
import 'package:sqflite/sqflite.dart';

class LocalApartHadiths implements ApartInterface {

  final DatabaseHelper _databaseHelper = DatabaseHelper();

  @override
  Future<List<ApartHadithModel>> getApartHadithsById({required String tableName, required int hadithId}) async {
    final Database dbClient = await _databaseHelper.db;
    final List<Map<String, Object?>> res = await dbClient.query(tableName, where: 'item_position = $hadithId');
    List<ApartHadithModel>? allChapterHadiths = res.isNotEmpty ? res.map((c) => ApartHadithModel.fromMap(c)).toList() : null;
    return allChapterHadiths!;
  }
}