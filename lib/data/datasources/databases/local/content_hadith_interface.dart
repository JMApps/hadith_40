
import 'package:hadith_40/data/models/content_hadith_model.dart';

abstract class ContentHadithInterface {
  Future<List<ContentHadithModel>> getContentHadith({
    required String tableName,
  });
}
