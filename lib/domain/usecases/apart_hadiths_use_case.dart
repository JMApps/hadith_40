import '../entities/apart_hadith_entity.dart';
import '../repositories/apart_hadiths_repository.dart';

class ApartHadithsUseCase {
  final ApartHadithsRepository apartHadithsRepository;

  ApartHadithsUseCase({required this.apartHadithsRepository});

  Future<List<ApartHadithEntity>> fetchApartHadithsById({required String tableName, required int hadithId}) async {
    try {
      final List<ApartHadithEntity> apartHadiths = await apartHadithsRepository.getApartByHadithId(tableName: tableName, hadithId: hadithId);
      return apartHadiths;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
