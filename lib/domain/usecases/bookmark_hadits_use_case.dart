import 'package:hadith_40/domain/repositories/bookmark_hadiths_repository.dart';

class BookmarkHadithsUseCase {
  final BookmarkHadithsRepository bookmarkHadithsRepository;

  BookmarkHadithsUseCase({required this.bookmarkHadithsRepository});

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
