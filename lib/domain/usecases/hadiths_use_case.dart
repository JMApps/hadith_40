import '../entities/hadith_entity.dart';
import '../repositories/hadiths_repository.dart';

class ChapterHadithsUseCase {
  final HadithsRepository chapterHadithsRepository;

  ChapterHadithsUseCase({required this.chapterHadithsRepository});

  Future<List<HadithEntity>> fetchAllHadiths({required String tableName}) async {
    try {
      final List<HadithEntity> allHadiths = await chapterHadithsRepository.getAllHadiths(tableName: tableName);
      return allHadiths;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<HadithEntity> fetchHadithById({required String tableName, required int hadithId}) async {
    try {
      final HadithEntity hadithById = await chapterHadithsRepository.getHadithById(tableName: tableName, hadithId: hadithId);
      return hadithById;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<List<HadithEntity>> fetchFavoriteHadiths({required String tableName, required List<int> favorites}) async {
    try {
      final List<HadithEntity> favoriteHadiths = await chapterHadithsRepository.getFavoriteHadiths(tableName: tableName, favorites: favorites);
      return favoriteHadiths;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
