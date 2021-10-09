import 'package:flutter/material.dart';
import 'package:hadith_40/data/database_query.dart';

class BookmarkState with ChangeNotifier {
  final _databaseQuery = DatabaseQuery();

  int _bookmarkState = 0;

  int get getUpdateList => _bookmarkState;

  updateBookmarkState(int state, int id) {
    _databaseQuery.addRemoveFavorite(state, id);
    _bookmarkState = state;
    notifyListeners();
  }
}