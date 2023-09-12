import 'package:hadith_40/domain/entities/apart_hadith_entity.dart';

abstract class ApartHadithsRepository {
  Future<List<ApartHadithEntity>> getApartHadithsById({
    required String tableName,
    required int hadithId,
  });
}
