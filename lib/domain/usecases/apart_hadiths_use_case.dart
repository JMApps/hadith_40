import '../entities/apart_hadith_entity.dart';
import '../repositories/apart_hadiths_repository.dart';

class ApartHadithsUseCase {
  final ApartHadithsRepository _apartHadithsRepository;

  const ApartHadithsUseCase({required ApartHadithsRepository apartHadithsRepository}) : _apartHadithsRepository = apartHadithsRepository;

  Future<List<ApartHadithEntity>> fetchApartHadithsById({required String tableName, required int hadithId}) async {
    try {
      return await _apartHadithsRepository.getApartByHadithId(tableName: tableName, hadithId: hadithId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<String>> fetchListTrack({required int hadithId}) async {
    try {
      return await _apartHadithsRepository.getTrackList(hadithId: hadithId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
