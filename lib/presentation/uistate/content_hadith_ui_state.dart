import 'package:flutter/material.dart';

class ContentHadithUiState extends ChangeNotifier {

  ContentHadithUiState(this._contentPageIndex);

  int _contentPageIndex;

  int get getContentPageIndex => _contentPageIndex;

  set setContentPageIndex(int pageIndex) {
    _contentPageIndex = pageIndex;
    notifyListeners();
  }
}