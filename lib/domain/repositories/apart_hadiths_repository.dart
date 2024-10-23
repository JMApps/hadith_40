import '../entities/apart_hadith_entity.dart';

abstract class ApartHadithsRepository {
  Future<List<ApartHadithEntity>> getApartByHadithId({required String tableName, required int hadithId});
}