import 'package:sqflite/sqflite.dart';

import '../../core/strings/database_values.dart';
import '../../domain/entities/hadith_entity.dart';
import '../../domain/repositories/hadiths_repository.dart';
import '../models/hadith_model.dart';
import '../services/database_service.dart';

class HadithDataRepository implements HadithsRepository {
  final DatabaseService _databaseService;

  HadithDataRepository(this._databaseService);

  @override
  Future<List<HadithEntity>> getAllHadiths({required String tableName}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName);
    final List<HadithEntity> allHadiths = resources.isNotEmpty ? resources.map((e) => HadithEntity.fromModel(HadithModel.fromMap(e))).toList() : [];
    return allHadiths;
  }

  @override
  Future<HadithEntity> getHadithById({required String tableName, required int hadithId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName, where: '${DatabaseValues.dbId} = ?', whereArgs: [hadithId]);
    final HadithEntity? hadithById = resources.isNotEmpty ? HadithEntity.fromModel(HadithModel.fromMap(resources.first)) : null;
    return hadithById!;
  }

  @override
  Future<List<HadithEntity>> getFavoriteHadiths({required String tableName, required List<int> favorites}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName, where: '${DatabaseValues.dbId} IN (${favorites.map((id) => '?').join(', ')})', whereArgs: favorites);
    final List<HadithEntity> favoriteHadiths = resources.isNotEmpty ? resources.map((e) => HadithEntity.fromModel(HadithModel.fromMap(e))).toList() : [];
    return favoriteHadiths;
  }
}
