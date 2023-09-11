import 'package:hadith_40/domain/entities/hadith_entity.dart';

abstract class HadithRepository {
  Future<List<HadithEntity>> getAllHadiths();
}
