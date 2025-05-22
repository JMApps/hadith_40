import '../entities/hadith_entity.dart';
import '../repositories/hadiths_repository.dart';

class HadithsUseCase {
  final HadithsRepository hadithsRepository;

  const HadithsUseCase({required this.hadithsRepository});

  Future<List<HadithEntity>> fetchAllHadiths({required String tableName}) async {
    try {
      return await hadithsRepository.getAllHadiths(tableName: tableName);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<HadithEntity> fetchHadithById({required String tableName, required int hadithId}) async {
    try {
      return await hadithsRepository.getHadithById(tableName: tableName, hadithId: hadithId);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<HadithEntity>> fetchFavoriteHadiths({required String tableName, required List<int> favorites}) async {
    try {
      return await hadithsRepository.getFavoriteHadiths(tableName: tableName, favorites: favorites);
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
