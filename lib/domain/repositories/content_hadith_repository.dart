import 'package:hadith_40/domain/entities/content_hadith_entity.dart';

abstract class ContentHadithRepository {
  Future<ContentHadithEntity> getContentHadithById({
    required String tableName,
    required int hadithId,
  });
}
