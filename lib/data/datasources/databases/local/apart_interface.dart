import 'package:hadith_40/data/models/apart_hadith_model.dart';

abstract class ApartInterface {
  Future<List<ApartHadithModel>> getApartHadithsById({
    required String tableName,
    required int hadithId,
  });
}
