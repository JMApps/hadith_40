import 'package:hadith_40/domain/entities/apart_hadith_entity.dart';
import 'package:hadith_40/domain/repositories/apart_hadiths_repository.dart';

class ApartHadithsUseCase {
  final ApartHadithsRepository apartHadithsRepository;

  ApartHadithsUseCase({required this.apartHadithsRepository});

  Future<List<ApartHadithEntity>> getApartHadithsById({
    required String tableName,
    required int hadithId,
  }) async {
    try {
      final List<ApartHadithEntity> apartHadiths = await apartHadithsRepository.getApartHadithsById(tableName: tableName, hadithId: hadithId);
      return apartHadiths;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
