import 'package:flutter/material.dart';
import 'package:hadith_40/core/strings/app_constraints.dart';
import 'package:hadith_40/domain/repositories/toggle_bookmark_repository.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ToggleBookmarkState extends ChangeNotifier implements ToggleBookmarkRepository {

  final Box _bookmarkHadithsBox = Hive.box(AppConstraints.keyBookmarkHadithsBox);

  List<int> _bookmarkHadithsList = [];

  List<int> get getBookmarkHadithsList => _bookmarkHadithsList;

  ToggleBookmarkState() {
    _bookmarkHadithsList = _bookmarkHadithsBox.get(AppConstraints.keyBookmarkHadiths, defaultValue: <int>[]);
  }

  @override
  Future<void> toggleBookmark({required int hadithId}) async {
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
  bool isBookmark({required int hadithId}) {
    return _bookmarkHadithsList.contains(hadithId);
  }

  @override
  List<int> bookmarkIds() {
    return _bookmarkHadithsBox.get(AppConstraints.keyBookmarkHadiths, defaultValue: <int>[]);
  }
}