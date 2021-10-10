import 'package:flutter/material.dart';

class NavigatorIndexState with ChangeNotifier {
  int _selectedIndex = 0;

  int get getSelectedIndex => _selectedIndex;

  currentSelectedIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
