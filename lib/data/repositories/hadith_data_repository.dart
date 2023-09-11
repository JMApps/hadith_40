import 'package:hadith_40/data/datasources/local/databases/database_helper.dart';
import 'package:hadith_40/domain/entities/hadith_entity.dart';
import 'package:hadith_40/domain/repositories/hadith_repository.dart';
import 'package:sqflite/sqflite.dart';

class HadithDataRepository implements HadithRepository {

  final DatabaseHelper databaseHelper;

  HadithDataRepository({required this.databaseHelper});

  @override
  Future<List<HadithEntity>> getAllHadiths() async {
    final Database dbClient = await databaseHelper.db;
    var res = await dbClient.query('Table_of_hadith_ru');
    List<HadithEntity>? allHadiths = res.isNotEmpty ? res.map((c) => _mapToHadithEntity(c)).toList() : null;
    return allHadiths!;
  }

  // Mapping to entity
  HadithEntity _mapToHadithEntity(Map<String, dynamic> map) {
    return HadithEntity(
      id: map['id'] as int,
      hadithNumber: map['hadeeth_number'] as String,
      hadithTitle: map['hadeeth_title'] as String,
      hadithArabic: map['hadeeth_arabic'] as String,
      hadithTranslation: map['hadeeth_translation'] as String,
      nameAudio: map['name_audio'] as String,
    );
  }
}