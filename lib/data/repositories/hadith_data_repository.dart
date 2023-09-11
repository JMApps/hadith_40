import 'package:hadith_40/data/datasources/local/databases/database_helper.dart';
import 'package:hadith_40/data/models/hadith.dart';
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
    List<HadithEntity>? allHadiths = res.isNotEmpty ? res.map((c) => _mapToHadithEntity(Hadith.fromMap(c))).toList() : null;
    return allHadiths!;
  }

  // Mapping to entity
  HadithEntity _mapToHadithEntity(Hadith hadith) {
    return HadithEntity(
      id: hadith.id,
      hadithNumber: hadith.hadithNumber,
      hadithTitle: hadith.hadithTitle,
      hadithArabic: hadith.hadithArabic,
      hadithTranslation: hadith.hadithTranslation,
      nameAudio: hadith.nameAudio,
    );
  }
}