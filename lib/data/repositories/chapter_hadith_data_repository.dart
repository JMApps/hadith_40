import 'package:hadith_40/data/datasources/databases/local/queries/local_chapter_hadiths.dart';
import 'package:hadith_40/data/models/chapter_hadith.dart';
import 'package:hadith_40/domain/entities/chapter_hadith_entity.dart';
import 'package:hadith_40/domain/repositories/chapter_hadiths_repository.dart';

class ChapterHadithDataRepository implements ChapterHadithsRepository {
  final LocalChapterHadiths localChapterHadiths;

  ChapterHadithDataRepository({required this.localChapterHadiths});

  @override
  Future<List<ChapterHadithEntity>> getChapterHadiths({required String tableName}) async {
    final List<ChapterHadith> chapterHadiths = await localChapterHadiths.getChapterHadiths(tableName: tableName);
    final List<ChapterHadithEntity> chapterHadithEntities = chapterHadiths.map((chapterHadith) {
      return _mapToHadithEntity(chapterHadith);
    }).toList();
    return chapterHadithEntities;
  }

  // Mapping to entity
  ChapterHadithEntity _mapToHadithEntity(ChapterHadith hadith) {
    return ChapterHadithEntity(
      id: hadith.id,
      hadithNumber: hadith.hadithNumber,
      hadithTitle: hadith.hadithTitle,
    );
  }
}
