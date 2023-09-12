import 'package:hadith_40/domain/entities/chapter_hadith_entity.dart';
import 'package:hadith_40/domain/repositories/chapter_hadiths_repository.dart';

class ChapterHadithsUseCase {
  final ChapterHadithsRepository chapterHadithsRepository;

  ChapterHadithsUseCase({required this.chapterHadithsRepository});

  Future<List<ChapterHadithEntity>> getChapterHadiths({
    required String tableName,
  }) async {
    try {
      final List<ChapterHadithEntity> allChapterHadiths = await chapterHadithsRepository.getChapterHadiths(
        tableName: tableName,
      );
      return allChapterHadiths;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
