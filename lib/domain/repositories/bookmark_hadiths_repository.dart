abstract class BookmarkHadithsRepository {
  Future<void> toggleBookmarks({required int hadithId});

  bool isBookmarks({required int hadithId});

  List<int> bookmarkIds();
}