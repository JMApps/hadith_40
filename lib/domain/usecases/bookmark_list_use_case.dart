import 'package:hadith_40/domain/repositories/toggle_bookmark_repository.dart';

class BookmarkListUseCase {
  final ToggleBookmarkRepository bookmarkHadithsRepository;

  BookmarkListUseCase({required this.bookmarkHadithsRepository});

  Future<void> toggleBookmark({required int hadithId}) async {
    await bookmarkHadithsRepository.toggleBookmarks(hadithId: hadithId);
  }

  bool isBookmark({required int hadithId}) {
    return bookmarkHadithsRepository.isBookmarks(hadithId: hadithId);
  }

  List<int> bookmarkIds() {
    return bookmarkHadithsRepository.bookmarkIds();
  }
}
