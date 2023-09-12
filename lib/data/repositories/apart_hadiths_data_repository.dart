import 'package:hadith_40/data/datasources/databases/local/queries/local_apart_hadiths.dart';
import 'package:hadith_40/data/models/apart_hadith_model.dart';
import 'package:hadith_40/domain/entities/apart_hadith_entity.dart';
import 'package:hadith_40/domain/repositories/apart_hadiths_repository.dart';

class ApartHadithsDataRepository implements ApartHadithsRepository {

  final LocalApartHadiths localApartHadiths;

  ApartHadithsDataRepository({required this.localApartHadiths});

  @override
  Future<List<ApartHadithEntity>> getApartHadithsById({required String tableName, required int hadithId}) async {
    final List<ApartHadithModel> apartHadiths = await localApartHadiths.getApartHadithsById(tableName: tableName, hadithId: hadithId);
    final List<ApartHadithEntity> apartHadithEntities = apartHadiths.map((chapterHadith) {
      return _mapToHadithEntity(chapterHadith);
    }).toList();
    return apartHadithEntities;
  }

  // Mapping to entity
  ApartHadithEntity _mapToHadithEntity(ApartHadithModel hadith) {
    return ApartHadithEntity(
      id: hadith.id,
      hadithArabic: hadith.hadithArabic,
      hadithTranslation: hadith.hadithTranslation,
      nameAudio: hadith.nameAudio,
    );
  }
}