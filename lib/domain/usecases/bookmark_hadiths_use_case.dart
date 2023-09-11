import 'package:hadith_40/domain/entities/bookmark_hadith_entity.dart';
import 'package:hadith_40/domain/repositories/bookmark_hadith_repository.dart';

class BookmarkHadithsUseCase {
  final BookmarkHadithRepository bookmarkHadithRepository;

  BookmarkHadithsUseCase({required this.bookmarkHadithRepository});

  Future<List<BookmarkHadithEntity>> getBookmarkChapterHadiths({
    required String tableName,
    required List<int> bookmarks,
  }) async {
    try {
      final List<BookmarkHadithEntity> bookmarkHadiths =
          await bookmarkHadithRepository.getBookmarksChapterHadiths(
        tableName: tableName,
        bookmarks: bookmarks,
      );
      return bookmarkHadiths;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
