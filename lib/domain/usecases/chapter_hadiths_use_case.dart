import 'package:hadith_40/domain/entities/chapter_hadith_entity.dart';
import 'package:hadith_40/domain/repositories/chapter_hadith_repository.dart';

class ChapterHadithsUseCase {
  final ChapterHadithRepository chapterHadithRepository;

  ChapterHadithsUseCase({required this.chapterHadithRepository});

  Future<List<ChapterHadithEntity>> getAllChapterHadiths({
    required String tableName,
  }) async {
    try {
      final List<ChapterHadithEntity> chapterHadiths =
          await chapterHadithRepository.getAllChapterHadiths(
        tableName: tableName,
      );
      return chapterHadiths;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
