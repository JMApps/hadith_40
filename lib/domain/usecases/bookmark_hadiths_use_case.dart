import 'package:hadith_40/domain/entities/chapter_hadith_entity.dart';
import 'package:hadith_40/domain/repositories/bookmark_hadiths_repository.dart';

class BookmarkHadithsUseCase {
  final BookmarkHadithsRepository bookmarkHadithsRepository;

  BookmarkHadithsUseCase({required this.bookmarkHadithsRepository});

  Future<List<ChapterHadithEntity>> getBookmarkHadiths({
    required String tableName,
    required List<int> bookmarks,
  }) async {
    try {
      final List<ChapterHadithEntity> bookmarkChapterHadiths = await bookmarkHadithsRepository.getBookmarkHadiths(
        tableName: tableName,
        bookmarks: bookmarks,
      );
      return bookmarkChapterHadiths;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
