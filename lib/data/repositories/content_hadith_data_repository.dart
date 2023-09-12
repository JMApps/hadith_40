import 'package:hadith_40/data/datasources/databases/local/queries/local_content_hadith.dart';
import 'package:hadith_40/data/models/content_hadith_model.dart';
import 'package:hadith_40/domain/entities/content_hadith_entity.dart';
import 'package:hadith_40/domain/repositories/content_hadith_repository.dart';

class ContentHadithDataRepository implements ContentHadithRepository {
  final LocalContentHadith localContentHadith;

  ContentHadithDataRepository({required this.localContentHadith});

  @override
  Future<List<ContentHadithEntity>> getContentHadith({required String tableName, required int hadithId}) async {
    final List<ContentHadithModel> hadithById = await localContentHadith.getContentHadith(tableName: tableName, hadithId: hadithId);
    final List<ContentHadithEntity> hadithByIdEntities = hadithById.map((chapterHadith) {
      return _mapToHadithEntity(chapterHadith);
    }).toList();
    return hadithByIdEntities;
  }

  // Mapping to entity
  ContentHadithEntity _mapToHadithEntity(ContentHadithModel hadith) {
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
