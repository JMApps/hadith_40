import 'package:hadith_40/domain/repositories/toggle_bookmark_repository.dart';

class ToggleBookmarkUseCase {
  final ToggleBookmarkRepository bookmarkHadithsRepository;

  ToggleBookmarkUseCase({required this.bookmarkHadithsRepository});

  Future<void> toggleBookmark({required int hadithId}) async {
    await bookmarkHadithsRepository.toggleBookmark(hadithId: hadithId);
  }

  bool isBookmark({required int hadithId}) {
    return bookmarkHadithsRepository.isBookmark(hadithId: hadithId);
  }

  List<int> bookmarkIds() {
    return bookmarkHadithsRepository.bookmarkIds();
  }
}
