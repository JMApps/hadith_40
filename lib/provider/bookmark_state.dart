import 'package:flutter/material.dart';
import 'package:hadith_40/data/database_query.dart';

class BookmarkState with ChangeNotifier {
  bool _updateList = true;

  bool get getUpdateList => _updateList;

  final _databaseQuery = DatabaseQuery();

  updateBookmarkState(int state, int id) {
    _databaseQuery.addRemoveFavorite(state, id);
    _updateList = !_updateList;
    notifyListeners();
  }
}
