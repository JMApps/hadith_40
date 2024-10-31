import '../entities/apart_hadith_entity.dart';
import '../repositories/apart_hadiths_repository.dart';

class ApartHadithsUseCase {
  final ApartHadithsRepository _apartHadithsRepository;

  ApartHadithsUseCase({required ApartHadithsRepository apartHadithsRepository}) : _apartHadithsRepository = apartHadithsRepository;

  Future<List<ApartHadithEntity>> fetchApartHadithsById({required String tableName, required int hadithId}) async {
    try {
      final List<ApartHadithEntity> apartHadiths = await _apartHadithsRepository.getApartByHadithId(tableName: tableName, hadithId: hadithId);
      return apartHadiths;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<String>> fetchListTrack({required int hadithId}) async {
    try {
      final List<String> trackList = await _apartHadithsRepository.getTrackList(hadithId: hadithId);
      return trackList;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
