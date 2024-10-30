import 'package:sqflite/sqflite.dart';

import '../../core/strings/database_values.dart';
import '../../domain/entities/apart_hadith_entity.dart';
import '../../domain/repositories/apart_hadiths_repository.dart';
import '../models/apart_hadith_model.dart';
import '../services/database_service.dart';

class ApartHadithDataRepository implements ApartHadithsRepository {
  final DatabaseService _databaseService;

  ApartHadithDataRepository(this._databaseService);

  @override
  Future<List<ApartHadithEntity>> getApartByHadithId({required String tableName, required int hadithId}) async {
    final Database database = await _databaseService.db;
    final List<Map<String, Object?>> resources = await database.query(tableName, where: '${DatabaseValues.dbItemPosition} = ?', whereArgs: [hadithId]);
    final List<ApartHadithEntity> apartHadithById = resources.isNotEmpty ? resources.map((e) => ApartHadithEntity.fromModel(ApartHadithModel.fromMap(e))).toList() : [];
    return apartHadithById;
  }
}