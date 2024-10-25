import 'package:flutter/material.dart';

class ContentIndexState extends ChangeNotifier {
  int _contentIndex;

  ContentIndexState(this._contentIndex);

  int get getContentIndex => _contentIndex;

  set setContentIndex(int index) {
    _contentIndex = index;
    notifyListeners();
  }
}