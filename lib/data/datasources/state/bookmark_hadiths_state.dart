import 'package:flutter/material.dart';
import 'package:hadith_40/core/strings/app_constraints.dart';
import 'package:hadith_40/domain/repositories/bookmark_hadiths_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class BookmarkHadithsState extends ChangeNotifier implements BookmarkHadithsRepository {

  final Box _bookmarkHadithsBox = Hive.box(AppConstraints.keyBookmarkHadithsBox);

  List<int> _bookmarkHadithsList = [];

  List<int> get getBookmarkHadithsList => _bookmarkHadithsList;

  BookmarkHadithsState() {
    _bookmarkHadithsList = _bookmarkHadithsBox.get(AppConstraints.keyBookmarkHadiths, defaultValue: <int>[]);
  }

  @override
  Future<void> toggleBookmarks({required int hadithId}) async {
    final exist = _bookmarkHadithsList.contains(hadithId);
    if (exist) {
      _bookmarkHadithsList.remove(hadithId);
    } else {
      _bookmarkHadithsList.add(hadithId);
    }
    await _bookmarkHadithsBox.put(AppConstraints.keyBookmarkHadiths, _bookmarkHadithsList);
    notifyListeners();
  }

  @override
  bool isBookmarks({required int hadithId}) {
    return _bookmarkHadithsList.contains(hadithId);
  }

  @override
  List<int> bookmarkIds() {
    return _bookmarkHadithsBox.get(AppConstraints.keyBookmarkHadiths, defaultValue: <int>[]);
  }
}