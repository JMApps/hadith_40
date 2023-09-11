import 'package:flutter/material.dart';

class MainUiState extends ChangeNotifier {
  int _bottomBarIndex = 0;

  int get getBottomBarIndex => _bottomBarIndex;

  set setBottomBarIndex(int index) {
    _bottomBarIndex = index;
    notifyListeners();
  }
}
