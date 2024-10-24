import 'package:flutter/material.dart';

class MainState extends ChangeNotifier {
  int _bottomIndex = 0;

  int get getBottomIndex => _bottomIndex;

  set setBottomIndex(int index) {
    _bottomIndex = index;
    notifyListeners();
  }
}