import 'package:flutter/material.dart';

class MainUiState extends ChangeNotifier {
  int _bottomBarIndex = 0;

  int get getBottomBarIndex => _bottomBarIndex;

  set setBottomBarIndex(int index) {
    _bottomBarIndex = index;
    notifyListeners();
  }

  int _contentPageIndex = 0;

  int get getContentPageIndex => _contentPageIndex;

  set setContentPageIndex(int pageIndex) {
    _contentPageIndex = pageIndex;
    notifyListeners();
  }
}
