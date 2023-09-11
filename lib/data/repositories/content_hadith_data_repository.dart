import 'package:hadith_40/data/datasources/local/databases/database_helper.dart';
import 'package:hadith_40/data/models/content_hadith.dart';
import 'package:hadith_40/domain/entities/content_hadith_entity.dart';
import 'package:hadith_40/domain/repositories/content_hadith_repository.dart';
import 'package:sqflite/sqflite.dart';

class ContentHadithDataRepository implements ContentHadithRepository {
  final DatabaseHelper databaseHelper;

  ContentHadithDataRepository({required this.databaseHelper});

  @override
  Future<ContentHadithEntity> getContentHadithById({required String tableName, required int hadithId}) async {
    final Database dbClient = await databaseHelper.db;
    final List<Map<String, Object?>> res = await dbClient.query(tableName, where: 'id = $hadithId');
    final ContentHadithEntity contentHadith = _mapToHadithEntity(ContentHadith.fromMap(res.first));
    return contentHadith;
  }

  // Mapping to entity
  ContentHadithEntity _mapToHadithEntity(ContentHadith hadith) {
    return ContentHadithEntity(
      id: hadith.id,
      hadithNumber: hadith.hadithNumber,
      hadithTitle: hadith.hadithTitle,
      hadithArabic: hadith.hadithArabic,
      hadithTranslation: hadith.hadithTranslation,
      nameAudio: hadith.nameAudio,
    );
  }
}
