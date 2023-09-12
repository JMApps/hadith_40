import 'package:hadith_40/data/models/content_hadith.dart';

abstract class ContentHadithInterface {
  Future<List<ContentHadith>> getContentHadith({
    required String tableName,
    required int hadithId,
  });
}
