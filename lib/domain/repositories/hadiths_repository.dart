import '../entities/hadith_entity.dart';

abstract class HadithsRepository {
  Future<List<HadithEntity>> getAllHadiths({required String tableName});

  Future<HadithEntity> getHadithById({required String tableName, required int hadithId});

  Future<List<HadithEntity>> getFavoriteHadiths({required String tableName, required List<int> favorites});

}
