abstract class ToggleBookmarkRepository {
  Future<void> toggleBookmark({required int hadithId});

  bool isBookmark({required int hadithId});

  List<int> bookmarkIds();
}